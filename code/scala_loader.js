autowatch = 1;
inlets = 1;
outlets = 2;

function _readAll(path) {
    var f = new File(path, "read");
    if (!f.isopen) return null;
    var txt = "";
    while (f.position < f.eof) {
        txt += f.readstring(2048);
    }
    f.close();
    return txt;
}

function _ratioToCents(num, den) {
    return 1200.0 * Math.log(num / den) / Math.log(2);
}

function parse(path) {
    var txt = _readAll(path);
    if (!txt) {
        outlet(1, ["error", "cannot open", path]);
        return;
    }

    var lines = txt.split(/\r?\n/);
    var values = [];
    var noteCount = -1;

    var i;
    for (i = 0; i < lines.length; i++) {
        var line = lines[i];
        if (!line) continue;
        var t = line.replace(/^\s+|\s+$/g, "");
        if (!t) continue;
        if (t.charAt(0) === "!") continue;

        if (noteCount < 0 && /^\d+$/.test(t)) {
            noteCount = parseInt(t, 10);
            continue;
        }

        var core = t.split(/\s+/)[0];
        if (core.indexOf("/") > 0) {
            var nd = core.split("/");
            var n = parseFloat(nd[0]);
            var d = parseFloat(nd[1]);
            if (n > 0 && d > 0) values.push(_ratioToCents(n, d));
        } else if (core.indexOf(".") >= 0 || /^\d+$/.test(core)) {
            values.push(parseFloat(core));
        }
    }

    outlet(0, ["scale_size", values.length]);
    outlet(1, ["cents"].concat(values));
}
