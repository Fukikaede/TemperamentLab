autowatch = 1;
inlets = 1;
outlets = 1;

var csvPath = "";
var jsonPath = "";
var headers = [
    "timestamp_iso",
    "trial_id",
    "chord_id",
    "root_midi",
    "voicing",
    "profile",
    "timbre",
    "mode",
    "topbeatsn",
    "attack_ms",
    "decay_ms",
    "sustain",
    "release_ms",
    "play_amp",
    "duration_ms",
    "temperament_A",
    "temperament_B",
    "X_is",
    "user_choice",
    "correct",
    "rt_ms",
    "rating_consonance",
    "rating_roughness",
    "rating_tension",
    "beat_energy",
    "roughness_score"
];

function _timestamp() {
    var d = new Date();
    return d.toISOString ? d.toISOString() : d.toString();
}

function setpaths(csv, json) {
    csvPath = String(csv);
    jsonPath = String(json);
    outlet(0, ["paths", csvPath, jsonPath]);
}

function _ensureCSVHeader() {
    var f = new File(csvPath, "read");
    var hasContent = false;
    if (f.isopen) {
        hasContent = (f.eof > 0);
        f.close();
    }

    if (!hasContent) {
        var w = new File(csvPath, "write");
        if (!w.isopen) {
            outlet(0, ["error", "cannot write csv", csvPath]);
            return;
        }
        w.writestring(headers.join(",") + "\n");
        w.close();
    }
}

function _csvEscape(s) {
    var t = String(s);
    if (t.indexOf(",") >= 0 || t.indexOf("\"") >= 0 || t.indexOf("\n") >= 0) {
        t = t.replace(/\"/g, "\"\"");
        return "\"" + t + "\"";
    }
    return t;
}

// logtrial key value key value ...
function logtrial() {
    var args = arrayfromargs(arguments);
    if (!csvPath || !jsonPath) {
        outlet(0, ["error", "setpaths csv json first"]);
        return;
    }

    var rec = {};
    rec.timestamp_iso = _timestamp();

    var i;
    for (i = 0; i + 1 < args.length; i += 2) {
        rec[String(args[i])] = args[i + 1];
    }

    _ensureCSVHeader();

    var row = [];
    for (i = 0; i < headers.length; i++) {
        var h = headers[i];
        row.push(_csvEscape(rec[h] !== undefined ? rec[h] : ""));
    }

    var fcsv = new File(csvPath, "append");
    if (!fcsv.isopen) {
        outlet(0, ["error", "cannot append csv", csvPath]);
        return;
    }
    fcsv.writestring(row.join(",") + "\n");
    fcsv.close();

    var fjson = new File(jsonPath, "append");
    if (!fjson.isopen) {
        outlet(0, ["error", "cannot append json", jsonPath]);
        return;
    }
    fjson.writestring(JSON.stringify(rec) + "\n");
    fjson.close();

    outlet(0, ["logged", rec.timestamp_iso]);
}
