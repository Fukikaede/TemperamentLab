{
  "patcher": {
    "fileversion": 1,
    "appversion": {"major": 9, "minor": 0, "revision": 5, "architecture": "x64", "modernui": 1},
    "classnamespace": "box",
    "rect": [80.0, 120.0, 980.0, 580.0],
    "gridsize": [15.0, 15.0],
    "boxes": [
      {"box": {"id": "obj-1", "maxclass": "comment", "patching_rect": [40.0, 20.0, 580.0, 20.0], "text": "poly_synth v2: accepts playfreqs/freqs via poly_router, renders through synth_voice"}},
      {"box": {"id": "obj-2", "maxclass": "newobj", "text": "inlet", "patching_rect": [40.0, 60.0, 35.0, 22.0], "numinlets": 1, "numoutlets": 1}},
      {"box": {"id": "obj-3", "maxclass": "newobj", "text": "js ../code/poly_router.js", "patching_rect": [40.0, 100.0, 150.0, 22.0], "numinlets": 1, "numoutlets": 1}},
      {"box": {"id": "obj-4", "maxclass": "newobj", "text": "poly~ synth_voice 8", "patching_rect": [200.0, 100.0, 120.0, 22.0], "numinlets": 1, "numoutlets": 2}},
      {"box": {"id": "obj-5", "maxclass": "newobj", "text": "clip~ -0.98 0.98", "patching_rect": [330.0, 100.0, 105.0, 22.0], "numinlets": 3, "numoutlets": 1}},
      {"box": {"id": "obj-6", "maxclass": "newobj", "text": "gain~", "patching_rect": [420.0, 95.0, 100.0, 35.0], "numinlets": 1, "numoutlets": 2}},
      {"box": {"id": "obj-7", "maxclass": "newobj", "text": "ezdac~", "patching_rect": [530.0, 105.0, 45.0, 22.0], "numinlets": 2, "numoutlets": 0}}
    ],
    "lines": [
      {"patchline": {"source": ["obj-2", 0], "destination": ["obj-3", 0]}},
      {"patchline": {"source": ["obj-3", 0], "destination": ["obj-4", 0]}},
      {"patchline": {"source": ["obj-4", 0], "destination": ["obj-5", 0]}},
      {"patchline": {"source": ["obj-5", 0], "destination": ["obj-6", 0]}},
      {"patchline": {"source": ["obj-6", 0], "destination": ["obj-7", 0]}},
      {"patchline": {"source": ["obj-6", 1], "destination": ["obj-7", 1]}}
    ],
    "originid": "pat-temperamentlab-polysynth-v2",
    "autosave": 0
  }
}
