autowatch = 1;
inlets = 1;
outlets = 4;

// 0: freqs for synth
// 1: analysis metrics
// 2: status/debug
// 3: logtrial key-value message for logger

var tables = null;

var chordIntervals = {
    maj: [0, 4, 7],
    min: [0, 3, 7],
    dim: [0, 3, 6],
    aug: [0, 4, 8],
    sus2: [0, 2, 7],
    sus4: [0, 5, 7],
    maj7: [0, 4, 7, 11],
    min7: [0, 3, 7, 10],
    dom7: [0, 4, 7, 10],
    m7b5: [0, 3, 6, 10],
    add9: [0, 4, 7, 14]
};

var state = {
    mode: "global",
    rootMidi: 60,
    chordType: "maj",
    inversion: 0,
    voicing: "root",
    temperament: "12-TET",
    tempA: "12-TET",
    tempB: "Werckmeister III",
    trialId: 0,
    xIs: "A",
    trialStartMs: 0,
    ratingConsonance: 4,
    ratingRoughness: 4,
    ratingTension: 4,
    profile: "teaching",
    timbre: "sine",
    playAmp: 0.22,
    playDurMs: 1200,
    attackMs: 20,
    decayMs: 120,
    sustain: 0.7,
    releaseMs: 350,
    harmonics: 8,
    beatCutoff: 30,
    topBeatsN: 5,
    chordId: "Cmaj",
    batchActive: 0,
    batchTotal: 0,
    batchDone: 0,
    batchCorrect: 0,
    batchRtSum: 0,
    batchAutoPlay: 1,
    batchGapMs: 900
};

var _batchTasks = [];

function _nowISO() {
    var d = new Date();
    return d.toISOString ? d.toISOString() : d.toString();
}

function _nowMs() {
    return new Date().getTime();
}

function _readJSON(path) {
    var f = new File(path, "read");
    if (!f.isopen) {
        outlet(2, ["error", "cannot_open", path]);
        return null;
    }
    var txt = "";
    while (f.position < f.eof) txt += f.readstring(2048);
    f.close();
    return JSON.parse(txt);
}

function loadtables(path) {
    var parsed = _readJSON(path);
    if (!parsed) return;
    tables = parsed;
    outlet(2, ["tables_loaded", path]);
}

function mtof_equal(midi) {
    return 440.0 * Math.pow(2, (midi - 69) / 12.0);
}

function _clone(a) {
    var out = [];
    for (var i = 0; i < a.length; i++) out.push(a[i]);
    return out;
}

function _applyInversion(intervals, inv) {
    var out = _clone(intervals);
    var i;
    for (i = 0; i < inv; i++) {
        if (out.length === 0) break;
        var moved = out.shift();
        out.push(moved + 12);
    }
    return out;
}

function _applyVoicing(intervals, v) {
    var out = _clone(intervals);
    if (v === "open" && out.length >= 3) out[1] += 12;
    if (v === "drop2" && out.length >= 4) out[out.length - 2] -= 12;
    out.sort(function(a, b) { return a - b; });
    return out;
}

function _currentIntervals() {
    var ints = chordIntervals[state.chordType] || chordIntervals.maj;
    ints = _applyInversion(ints, state.inversion);
    ints = _applyVoicing(ints, state.voicing);
    return ints;
}

function _globalFreq(midi, temperamentName) {
    if (!tables) return mtof_equal(midi);
    var temps = tables.temperaments || {};
    var centsArr = temps[temperamentName] || temps["12-TET"] || [];
    var pc = ((midi % 12) + 12) % 12;
    var cents = centsArr[pc] || 0.0;
    return mtof_equal(midi) * Math.pow(2, cents / 1200.0);
}

function _justRelative(rootMidi, interval) {
    if (!tables || !tables.chord_relative_just) return mtof_equal(rootMidi + interval);
    var ratios = tables.chord_relative_just[state.chordType] || tables.chord_relative_just.maj;
    var baseInts = chordIntervals[state.chordType] || chordIntervals.maj;
    var idx = -1;
    var i;
    for (i = 0; i < baseInts.length; i++) {
        if (baseInts[i] === ((interval % 12) + 12) % 12 || baseInts[i] === interval) {
            idx = i;
            break;
        }
    }
    if (idx < 0 || idx >= ratios.length) return mtof_equal(rootMidi + interval);

    var oct = Math.floor(interval / 12);
    var f = mtof_equal(rootMidi) * ratios[idx] * Math.pow(2, oct);
    return f;
}

function _chordFreqs(temperamentName) {
    var ints = _currentIntervals();
    var freqs = [];
    var i;
    for (i = 0; i < ints.length; i++) {
        var midi = state.rootMidi + ints[i];
        var f = (state.mode === "chord_relative_just") ? _justRelative(state.rootMidi, ints[i]) : _globalFreq(midi, temperamentName);
        freqs.push(f);
    }
    return freqs;
}

function _amp(k) { return 1.0 / k; }
function _cbw(f) { return 24.7 * (4.37 * f / 1000.0 + 1.0); }
function _g(x) {
    if (x <= 0) return 0;
    var a = Math.exp(-3.5 * x);
    var b = Math.exp(-5.75 * x);
    var y = a - b;
    return y > 0 ? y : 0;
}

function _analyze(freqs) {
    var partials = [];
    var i, j, k;
    for (i = 0; i < freqs.length; i++) {
        for (k = 1; k <= state.harmonics; k++) {
            partials.push({ f: freqs[i] * k, a: _amp(k), src: i, h: k });
        }
    }

    var beatItems = [];
    var nearItems = [];
    var beatEnergy = 0.0;
    var roughness = 0.0;

    for (i = 0; i < partials.length; i++) {
        for (j = i + 1; j < partials.length; j++) {
            var p = partials[i];
            var q = partials[j];
            if (p.src === q.src) continue;
            var df = Math.abs(p.f - q.f);
            var w = p.a * q.a;

            if (df > 0 && df <= state.beatCutoff) {
                beatItems.push([df, w, p.src, p.h, q.src, q.h]);
                beatEnergy += w;
            }
            // Keep a fallback pool of near-unison candidates so Top Beats UI still moves
            // when strict beat cutoff yields no items for the current chord/temperament.
            if (df > 0 && df <= 120) {
                nearItems.push([df, w, p.src, p.h, q.src, q.h]);
            }

            var fmean = 0.5 * (p.f + q.f);
            roughness += w * _g(df / _cbw(fmean));
        }
    }

    beatItems.sort(function(a, b) { return b[1] - a[1]; });
    nearItems.sort(function(a, b) {
        if (a[0] !== b[0]) return a[0] - b[0];
        return b[1] - a[1];
    });
    var nTop = Math.max(1, Math.min(20, state.topBeatsN || 5));
    var top = ["top_beats"];
    var topHz = [];
    var topDetail = ["top_beats_detail"];
    var topSrc = beatItems.length > 0 ? beatItems : nearItems;
    for (i = 0; i < nTop; i++) topHz.push(0);
    for (i = 0; i < Math.min(nTop, topSrc.length); i++) {
        topHz[i] = topSrc[i][0];
        topDetail.push(topSrc[i][0]);
        topDetail.push(topSrc[i][1]);
        top = top.concat(topSrc[i]);
    }
    outlet(1, ["metrics", "BeatEnergy", beatEnergy, "RoughnessScore", roughness]);
    outlet(1, top);
    outlet(1, ["beat_energy", beatEnergy]);
    outlet(1, ["roughness_score", roughness]);
    outlet(1, ["top_beats_hz"].concat(topHz));
    outlet(1, topDetail);

    return {
        beatEnergy: beatEnergy,
        roughness: roughness
    };
}

function _emitPlay(temperamentName, label) {
    var freqs = _chordFreqs(temperamentName);
    var m = _analyze(freqs);
    var modeIdx = 1;
    if (state.timbre === "additive") modeIdx = 2;
    else if (state.timbre === "bright") modeIdx = 3;
    outlet(0, ["playfreqs", modeIdx, state.playAmp, state.playDurMs, state.attackMs, state.decayMs, state.sustain, state.releaseMs].concat(freqs));
    outlet(2, ["played", label, temperamentName].concat(freqs));
    return m;
}

function _clearBatchTasks() {
    var i;
    for (i = 0; i < _batchTasks.length; i++) {
        try { _batchTasks[i].cancel(); } catch (e) {}
    }
    _batchTasks = [];
}

function _schedule(fn, delayMs) {
    var t = new Task(fn, this);
    _batchTasks.push(t);
    t.schedule(Math.max(0, delayMs));
}

function _autoplayCurrentTrial() {
    _clearBatchTasks();
    _schedule(function() { playa(); }, 0);
    _schedule(function() { playb(); }, state.batchGapMs);
    _schedule(function() { playx(); }, state.batchGapMs * 2);
}

function play() {
    _emitPlay(state.temperament, "CURRENT");
}

function playa() {
    _emitPlay(state.tempA, "A");
}

function playb() {
    _emitPlay(state.tempB, "B");
}

function playx() {
    var t = (state.xIs === "A") ? state.tempA : state.tempB;
    _emitPlay(t, "X");
}

function newtrial() {
    state.trialId += 1;
    state.xIs = (Math.random() < 0.5) ? "A" : "B";
    state.trialStartMs = _nowMs();
    outlet(2, ["trial", state.trialId, "A", state.tempA, "B", state.tempB, "X_is", state.xIs]);
}

function answer(choice) {
    var c = String(choice).toUpperCase();
    var rt = Math.max(0, _nowMs() - state.trialStartMs);
    var correct = (c === state.xIs) ? 1 : 0;
    var tX = (state.xIs === "A") ? state.tempA : state.tempB;

    var analysis = _analyze(_chordFreqs(tX));

    outlet(3, [
        "logtrial",
        "timestamp_iso", _nowISO(),
        "trial_id", state.trialId,
        "chord_id", state.chordId,
        "root_midi", state.rootMidi,
        "voicing", state.voicing,
        "profile", state.profile,
        "timbre", state.timbre,
        "mode", state.mode,
        "topbeatsn", state.topBeatsN,
        "attack_ms", state.attackMs,
        "decay_ms", state.decayMs,
        "sustain", state.sustain,
        "release_ms", state.releaseMs,
        "play_amp", state.playAmp,
        "duration_ms", state.playDurMs,
        "temperament_A", state.tempA,
        "temperament_B", state.tempB,
        "X_is", state.xIs,
        "user_choice", c,
        "correct", correct,
        "rt_ms", rt,
        "rating_consonance", state.ratingConsonance,
        "rating_roughness", state.ratingRoughness,
        "rating_tension", state.ratingTension,
        "beat_energy", analysis.beatEnergy,
        "roughness_score", analysis.roughness
    ]);

    outlet(2, ["answered", state.trialId, "choice", c, "correct", correct, "rt_ms", rt]);

    if (state.batchActive) {
        state.batchDone += 1;
        state.batchCorrect += correct;
        state.batchRtSum += rt;

        var acc = (state.batchDone > 0) ? (state.batchCorrect / state.batchDone) : 0;
        var meanRt = (state.batchDone > 0) ? (state.batchRtSum / state.batchDone) : 0;
        outlet(2, ["batch_progress", state.batchDone, state.batchTotal, "accuracy", acc, "mean_rt_ms", meanRt]);
        outlet(2, ["batch_progress_values", state.batchDone, state.batchTotal, acc, meanRt]);

        if (state.batchDone >= state.batchTotal) {
            state.batchActive = 0;
            _clearBatchTasks();
            outlet(2, ["batch_finished", state.batchDone, "accuracy", acc, "mean_rt_ms", meanRt]);
            outlet(2, ["batch_finished_values", state.batchDone, state.batchTotal, acc, meanRt]);
        } else {
            newtrial();
            if (state.batchAutoPlay) _autoplayCurrentTrial();
        }
    }
}

function setprofile(p) {
    var key = String(p || "").toLowerCase();
    if (key !== "teaching" && key !== "experiment") {
        outlet(2, ["error", "setprofile teaching|experiment"]);
        return;
    }

    state.profile = key;
    if (key === "teaching") {
        // Softer, less fatiguing for long classroom use
        state.timbre = "sine";
        state.playAmp = 0.16;
        state.attackMs = 25;
        state.decayMs = 140;
        state.sustain = 0.72;
        state.releaseMs = 420;
        state.harmonics = 6;
        state.beatCutoff = 30;
        state.batchGapMs = 1100;
    } else {
        // More contrast for critical listening experiments
        state.timbre = "bright";
        state.playAmp = 0.20;
        state.attackMs = 10;
        state.decayMs = 90;
        state.sustain = 0.58;
        state.releaseMs = 240;
        state.harmonics = 12;
        state.beatCutoff = 45;
        state.batchGapMs = 700;
    }

    outlet(2, [
        "profile_applied",
        state.profile,
        "timbre", state.timbre,
        "play_amp", state.playAmp,
        "adsr", state.attackMs, state.decayMs, state.sustain, state.releaseMs,
        "harmonics", state.harmonics,
        "beat_cutoff", state.beatCutoff,
        "batch_gap_ms", state.batchGapMs
    ]);
}

function setab() {
    var s = arrayfromargs(arguments).join(" ");
    var p = s.split("|");
    if (p.length < 2) {
        outlet(2, ["error", "usage", "setab <A> | <B>"]);
        return;
    }
    state.tempA = p[0].replace(/^\s+|\s+$/g, "");
    state.tempB = p[1].replace(/^\s+|\s+$/g, "");
    outlet(2, ["ab", state.tempA, state.tempB]);
}

function settemperament() {
    var a = arrayfromargs(arguments);
    state.temperament = a.join(" ");
    outlet(2, ["temperament", state.temperament]);
}

function setmode(m) {
    if (m === "global" || m === "chord_relative_just") {
        state.mode = m;
        outlet(2, ["mode", state.mode]);
    }
}

function setroot(m) {
    state.rootMidi = parseInt(m, 10) || 60;
    outlet(2, ["root_midi", state.rootMidi]);
}

function setchord(c) {
    if (chordIntervals[c]) {
        state.chordType = c;
        state.chordId = c;
        outlet(2, ["chord", state.chordType]);
    }
}

function setinversion(i) {
    state.inversion = Math.max(0, parseInt(i, 10) || 0);
    outlet(2, ["inversion", state.inversion]);
}

function setvoicing(v) {
    if (v === "root" || v === "open" || v === "drop2") {
        state.voicing = v;
        outlet(2, ["voicing", state.voicing]);
    }
}

function settimbre(t) {
    state.timbre = String(t);
    outlet(2, ["timbre", state.timbre]);
}

function setplayamp(v) {
    state.playAmp = Math.max(0.01, Math.min(1.0, parseFloat(v) || 0.22));
    outlet(2, ["play_amp", state.playAmp]);
}

function setduration(ms) {
    state.playDurMs = Math.max(50, parseInt(ms, 10) || 1200);
    outlet(2, ["play_duration_ms", state.playDurMs]);
}

function setattack(ms) {
    state.attackMs = Math.max(1, parseInt(ms, 10) || 20);
    outlet(2, ["attack_ms", state.attackMs]);
}

function setdecay(ms) {
    state.decayMs = Math.max(1, parseInt(ms, 10) || 120);
    outlet(2, ["decay_ms", state.decayMs]);
}

function setsustain(v) {
    state.sustain = Math.max(0.0, Math.min(1.0, parseFloat(v)));
    if (isNaN(state.sustain)) state.sustain = 0.7;
    outlet(2, ["sustain", state.sustain]);
}

function setrelease(ms) {
    state.releaseMs = Math.max(1, parseInt(ms, 10) || 350);
    outlet(2, ["release_ms", state.releaseMs]);
}

function setratingconsonance(v) { state.ratingConsonance = parseInt(v, 10) || 4; }
function setratingroughness(v) { state.ratingRoughness = parseInt(v, 10) || 4; }
function setratingtension(v) { state.ratingTension = parseInt(v, 10) || 4; }

function setharmonics(n) { state.harmonics = Math.max(1, parseInt(n, 10) || 8); }
function setbeatcutoff(v) { state.beatCutoff = Math.max(1, parseFloat(v) || 30); }
function settopbeatsn(n) { state.topBeatsN = Math.max(1, Math.min(20, parseInt(n, 10) || 5)); }
function setbatchautoplay(v) { state.batchAutoPlay = (parseInt(v, 10) === 0) ? 0 : 1; }
function setbatchgap(ms) { state.batchGapMs = Math.max(200, parseInt(ms, 10) || 900); }

function startbatch(n) {
    var total = Math.max(1, parseInt(n, 10) || 20);
    state.batchActive = 1;
    state.batchTotal = total;
    state.batchDone = 0;
    state.batchCorrect = 0;
    state.batchRtSum = 0;
    outlet(2, ["batch_started", state.batchTotal]);
    newtrial();
    if (state.batchAutoPlay) _autoplayCurrentTrial();
}

function stopbatch() {
    state.batchActive = 0;
    _clearBatchTasks();
    outlet(2, ["batch_stopped", state.batchDone, state.batchTotal]);
}

function batchstatus() {
    var acc = (state.batchDone > 0) ? (state.batchCorrect / state.batchDone) : 0;
    var meanRt = (state.batchDone > 0) ? (state.batchRtSum / state.batchDone) : 0;
    outlet(2, [
        "batch_status",
        "active", state.batchActive,
        "done", state.batchDone,
        "total", state.batchTotal,
        "accuracy", acc,
        "mean_rt_ms", meanRt
    ]);
    outlet(2, ["batch_status_values", state.batchActive, state.batchDone, state.batchTotal, acc, meanRt]);
}

function listtemperaments() {
    if (!tables || !tables.temperaments) {
        outlet(2, ["error", "tables_not_loaded"]);
        return;
    }
    for (var k in tables.temperaments) {
        outlet(2, ["temperament_name", k]);
    }
}
