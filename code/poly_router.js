autowatch = 1;
inlets = 1;
outlets = 1;

var durationMs = 1200;
var amplitude = 0.25;
var modeIndex = 1;
var attackMs = 20;
var decayMs = 120;
var sustain = 0.7;
var releaseMs = 350;

function setduration(ms) {
    durationMs = Math.max(50, parseInt(ms, 10) || 1200);
}

function setamp(a) {
    amplitude = Math.max(0.01, Math.min(1.0, parseFloat(a) || 0.25));
}

function setmode(m) {
    var s = String(m).toLowerCase();
    if (s === "1" || s === "sine") modeIndex = 1;
    else if (s === "2" || s === "additive") modeIndex = 2;
    else if (s === "3" || s === "bright") modeIndex = 3;
}

function setadsr(a, d, s, r) {
    attackMs = Math.max(1, parseFloat(a) || 20);
    decayMs = Math.max(1, parseFloat(d) || 120);
    sustain = Math.max(0.0, Math.min(1.0, parseFloat(s)));
    if (isNaN(sustain)) sustain = 0.7;
    releaseMs = Math.max(1, parseFloat(r) || 350);
}

function _emitStopAll() {
    var i;
    for (i = 1; i <= 8; i++) {
        outlet(0, ["target", i]);
        outlet(0, [0.0, 0.0, modeIndex, attackMs, decayMs, sustain, releaseMs, 0]);
    }
}

function freqs() {
    var a = arrayfromargs(arguments);
    var i;
    _emitStopAll();

    for (i = 0; i < a.length && i < 8; i++) {
        var f = parseFloat(a[i]);
        outlet(0, ["target", i + 1]);
        outlet(0, [f, amplitude, modeIndex, attackMs, decayMs, sustain, releaseMs, 1]);
    }

    // naive timed release shared for all voices
    var t = new Task(function() {
        _emitStopAll();
    }, this);
    t.schedule(durationMs);
}

// playfreqs <modeIdx> <amp> <durMs> <attack> <decay> <sustain> <release> <f1> <f2> ...
function playfreqs() {
    var a = arrayfromargs(arguments);
    if (a.length < 8) return;

    modeIndex = Math.max(1, Math.min(3, parseInt(a[0], 10) || 1));
    amplitude = Math.max(0.01, Math.min(1.0, parseFloat(a[1]) || 0.25));
    durationMs = Math.max(50, parseInt(a[2], 10) || 1200);
    attackMs = Math.max(1, parseFloat(a[3]) || 20);
    decayMs = Math.max(1, parseFloat(a[4]) || 120);
    sustain = Math.max(0.0, Math.min(1.0, parseFloat(a[5])));
    if (isNaN(sustain)) sustain = 0.7;
    releaseMs = Math.max(1, parseFloat(a[6]) || 350);

    var freqsOnly = a.slice(7);
    freqs.apply(this, freqsOnly);
}

function list() {
    // Allow direct "freqs ..." forwarding if incoming list starts with symbol
    var a = arrayfromargs(messagename, arguments);
    if (a.length > 0 && String(a[0]) === "freqs") {
        a.shift();
        freqs.apply(this, a);
    } else if (a.length > 0 && String(a[0]) === "playfreqs") {
        a.shift();
        playfreqs.apply(this, a);
    }
}
