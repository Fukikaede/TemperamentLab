{
  "name": "TemperamentLab",
  "version": 1,
  "creationdate": "2026-03-02",
  "viewrect": [80.0, 120.0, 1100.0, 720.0],
  "contents": {
    "patchers": {
      "patchers/main.maxpat": {"kind": "patcher"},
      "patchers/tuning_engine.maxpat": {"kind": "patcher"},
      "patchers/chord_engine.maxpat": {"kind": "patcher"},
      "patchers/synth_voice.maxpat": {"kind": "patcher"},
      "patchers/poly_synth.maxpat": {"kind": "patcher"},
      "patchers/abx_test.maxpat": {"kind": "patcher"},
      "patchers/analysis.maxpat": {"kind": "patcher"}
    },
    "code": {
      "code/tuning_engine.js": {"kind": "javascript"},
      "code/chord_engine.js": {"kind": "javascript"},
      "code/analysis.js": {"kind": "javascript"},
      "code/abx_test.js": {"kind": "javascript"},
      "code/lab_controller.js": {"kind": "javascript"},
      "code/poly_router.js": {"kind": "javascript"},
      "code/logger.js": {"kind": "javascript"},
      "code/scala_loader.js": {"kind": "javascript"},
      "code/tuning_tables.json": {"kind": "json"}
    },
    "data": {
      "data/logs": {"kind": "folder"},
      "data/scales": {"kind": "folder"}
    }
  }
}
