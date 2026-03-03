autowatch = 1;
inlets = 1;
outlets = 3;

var harmonics = 8;
var beatCutoff = 30.0;
var topN = 5;

function setharmonics(n) {
    harmonics = Math.max(1, parseInt(n, 10) || 8);
}

function setbeatcutoff(hz) {
    beatCutoff = Math.max(1, parseFloat(hz) || 30.0);
}

function settopn(n) {
    topN = Math.max(1, parseInt(n, 10) || 5);
}

function _amp(k) {
    return 1.0 / k;
}

function _cbw(f) {
    // Approximate critical bandwidth in Hz (simple engineering approximation)
    return 24.7 * (4.37 * f / 1000.0 + 1.0);
}

function _g(x) {
    // Roughness shape: peak around x=0.25, decays for larger x
    if (x <= 0) return 0;
    var a = Math.exp(-3.5 * x);
    var b = Math.exp(-5.75 * x);
    var y = a - b;
    return y > 0 ? y : 0;
}

function analyze() {
    var a = arrayfromargs(arguments);
    if (a.length < 2) {
        outlet(2, ["error", "usage: analyze f1 f2 ..."]);
        return;
    }

    var freqs = [];
    var i, j, k;
    for (i = 0; i < a.length; i++) {
        freqs.push(parseFloat(a[i]));
    }

    var partials = [];
    for (i = 0; i < freqs.length; i++) {
        for (k = 1; k <= harmonics; k++) {
            partials.push({
                f: freqs[i] * k,
                a: _amp(k),
                src: i,
                h: k
            });
        }
    }

    var beatItems = [];
    var beatEnergy = 0.0;
    var roughness = 0.0;

    for (i = 0; i < partials.length; i++) {
        for (j = i + 1; j < partials.length; j++) {
            var p = partials[i];
            var q = partials[j];
            if (p.src === q.src) continue;

            var df = Math.abs(p.f - q.f);
            var w = p.a * q.a;

            if (df > 0 && df <= beatCutoff) {
                beatItems.push({
                    hz: df,
                    weight: w,
                    p1: p,
                    p2: q
                });
                beatEnergy += w;
            }

            var fmean = 0.5 * (p.f + q.f);
            var cbw = _cbw(fmean);
            roughness += w * _g(df / cbw);
        }
    }

    beatItems.sort(function(x, y) {
        return y.weight - x.weight;
    });

    var outTop = ["top_beats"];
    for (i = 0; i < Math.min(topN, beatItems.length); i++) {
        outTop.push(beatItems[i].hz);
        outTop.push(beatItems[i].weight);
        outTop.push(beatItems[i].p1.src);
        outTop.push(beatItems[i].p1.h);
        outTop.push(beatItems[i].p2.src);
        outTop.push(beatItems[i].p2.h);
    }

    outlet(0, outTop);
    outlet(1, ["metrics", "BeatEnergy", beatEnergy, "RoughnessScore", roughness]);
    outlet(2, ["summary", "partials", partials.length, "beat_pairs", beatItems.length]);
}
