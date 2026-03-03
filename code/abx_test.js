autowatch = 1;
inlets = 1;
outlets = 2;

var trialId = 0;
var current = null;
var startMs = 0;

function _now() {
    return new Date().getTime();
}

function _pickAB() {
    return Math.random() < 0.5 ? "A" : "B";
}

// newtrial <tempA...> | <tempB...>
function newtrial() {
    var s = arrayfromargs(arguments).join(" ");
    var parts = s.split("|");
    if (parts.length < 2) {
        outlet(1, ["error", "usage: newtrial <temperament A> | <temperament B>"]);
        return;
    }

    var tempA = parts[0].replace(/^\s+|\s+$/g, "");
    var tempB = parts[1].replace(/^\s+|\s+$/g, "");

    trialId += 1;
    current = {
        trial_id: trialId,
        temperament_A: tempA,
        temperament_B: tempB,
        X_is: _pickAB()
    };
    startMs = _now();

    outlet(0, ["trial", trialId, tempA, tempB, current.X_is]);
    outlet(1, ["ready", trialId]);
}

function revealx() {
    if (!current) return;
    var t = (current.X_is === "A") ? current.temperament_A : current.temperament_B;
    outlet(0, ["X", t]);
}

function answer(choice) {
    if (!current) {
        outlet(1, ["error", "no active trial"]);
        return;
    }
    var c = String(choice).toUpperCase();
    var rt = _now() - startMs;
    var correct = (c === current.X_is) ? 1 : 0;

    outlet(0, [
        "result",
        "trial_id", current.trial_id,
        "temperament_A", current.temperament_A,
        "temperament_B", current.temperament_B,
        "X_is", current.X_is,
        "user_choice", c,
        "correct", correct,
        "rt_ms", rt
    ]);

    outlet(1, ["done", current.trial_id, correct, rt]);
}
