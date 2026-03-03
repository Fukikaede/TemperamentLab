autowatch = 1;
inlets = 1;
outlets = 2;

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

var currentChord = "maj";
var inversion = 0;
var voicing = "root"; // root | open | drop2

function setchord(c) {
    if (chordIntervals[c]) {
        currentChord = c;
        outlet(1, ["chord", currentChord]);
    }
}

function setinversion(i) {
    inversion = Math.max(0, parseInt(i, 10) || 0);
    outlet(1, ["inversion", inversion]);
}

function setvoicing(v) {
    if (v === "root" || v === "open" || v === "drop2") {
        voicing = v;
        outlet(1, ["voicing", voicing]);
    }
}

function _clone(arr) {
    var out = [];
    for (var i = 0; i < arr.length; i++) out.push(arr[i]);
    return out;
}

function _applyInversion(intervals, inv) {
    var out = _clone(intervals);
    for (var i = 0; i < inv; i++) {
        if (out.length === 0) break;
        var moved = out.shift();
        out.push(moved + 12);
    }
    return out;
}

function _applyVoicing(intervals, v) {
    var out = _clone(intervals);
    if (v === "open" && out.length >= 3) {
        out[1] += 12;
    }
    if (v === "drop2" && out.length >= 4) {
        out[out.length - 2] -= 12;
    }
    out.sort(function(a, b) { return a - b; });
    return out;
}

// make <rootMidi> [chord]
function make() {
    var a = arrayfromargs(arguments);
    if (a.length < 1) {
        outlet(1, ["error", "usage: make rootMidi [chordType]"]);
        return;
    }

    var rootMidi = parseInt(a[0], 10);
    var c = (a.length >= 2) ? String(a[1]) : currentChord;
    if (!chordIntervals[c]) {
        c = "maj";
    }

    var ints = _clone(chordIntervals[c]);
    ints = _applyInversion(ints, inversion);
    ints = _applyVoicing(ints, voicing);

    var midiList = [];
    for (var i = 0; i < ints.length; i++) {
        midiList.push(rootMidi + ints[i]);
    }

    outlet(0, ["intervals"].concat(ints));
    outlet(1, ["midi"].concat(midiList));
}

function listchords() {
    for (var k in chordIntervals) {
        outlet(1, ["chord_type", k]);
    }
}
