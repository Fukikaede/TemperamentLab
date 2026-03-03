autowatch = 1;
inlets = 1;
outlets = 2;

var tables = null;
var mode = "global"; // global | chord_relative_just
var temperamentName = "12-TET";
var chordType = "maj";

function _readJSON(path) {
    var f = new File(path, "read");
    if (!f.isopen) {
        post("tuning_engine: cannot open " + path + "\n");
        return null;
    }
    var txt = "";
    while (f.position < f.eof) {
        txt += f.readstring(2048);
    }
    f.close();
    return JSON.parse(txt);
}

function loadtables(path) {
    var parsed = _readJSON(path);
    if (parsed) {
        tables = parsed;
        outlet(1, ["tables_loaded", path]);
    }
}

function setmode(m) {
    if (m === "global" || m === "chord_relative_just") {
        mode = m;
        outlet(1, ["mode", mode]);
    }
}

function settemperament() {
    var a = arrayfromargs(arguments);
    temperamentName = a.join(" ");
    outlet(1, ["temperament", temperamentName]);
}

function setchordtype(t) {
    chordType = t;
    outlet(1, ["chord_type", chordType]);
}

function mtof_equal(midi) {
    return 440.0 * Math.pow(2, (midi - 69) / 12.0);
}

function _globalFreq(midi) {
    if (!tables) {
        return mtof_equal(midi);
    }
    var temps = tables.temperaments || {};
    var centsArr = temps[temperamentName] || temps["12-TET"];
    var pc = ((midi % 12) + 12) % 12;
    var cents = centsArr[pc] || 0.0;
    return mtof_equal(midi) * Math.pow(2, cents / 1200.0);
}

function _justRelative(rootMidi, semitoneInterval) {
    if (!tables || !tables.chord_relative_just) {
        return mtof_equal(rootMidi + semitoneInterval);
    }
    var ratios = tables.chord_relative_just[chordType];
    if (!ratios) {
        ratios = tables.chord_relative_just.maj;
    }

    var idx = -1;
    var triads = {
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
    var ints = triads[chordType] || triads.maj;
    for (var i = 0; i < ints.length; i++) {
        if (ints[i] === semitoneInterval) {
            idx = i;
            break;
        }
    }
    if (idx < 0 || idx >= ratios.length) {
        return mtof_equal(rootMidi + semitoneInterval);
    }
    return mtof_equal(rootMidi) * ratios[idx];
}

// input: chord <rootMidi> <i1> <i2> ...
function chord() {
    var a = arrayfromargs(arguments);
    if (a.length < 2) {
        outlet(1, ["error", "usage: chord rootMidi intervals..."]);
        return;
    }

    var rootMidi = parseInt(a[0], 10);
    var freqs = [];
    var debugPairs = [];

    for (var i = 1; i < a.length; i++) {
        var interval = parseInt(a[i], 10);
        var midi = rootMidi + interval;
        var freq = (mode === "chord_relative_just")
            ? _justRelative(rootMidi, interval)
            : _globalFreq(midi);

        freqs.push(freq);
        debugPairs.push(midi);
        debugPairs.push(freq);
    }

    outlet(0, ["freqs"].concat(freqs));
    outlet(1, ["mapped"].concat(debugPairs));
}

function note(midi) {
    var m = parseInt(midi, 10);
    var f = _globalFreq(m);
    outlet(0, ["freq", m, f]);
}

function listtemperaments() {
    if (!tables || !tables.temperaments) {
        outlet(1, ["error", "tables not loaded"]);
        return;
    }
    for (var k in tables.temperaments) {
        outlet(1, ["temperament_name", k]);
    }
}
