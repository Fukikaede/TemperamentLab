{
  "patcher": {
    "fileversion": 1,
    "appversion": {"major": 9, "minor": 0, "revision": 5, "architecture": "x64", "modernui": 1},
    "classnamespace": "box",
    "rect": [80.0, 120.0, 700.0, 420.0],
    "gridsize": [15.0, 15.0],
    "boxes": [
      {"box": {"id": "obj-1", "maxclass": "comment", "patching_rect": [30.0, 20.0, 460.0, 20.0], "text": "abx_test: newtrial A|B, revealx, answer A/B"}},
      {"box": {"id": "obj-2", "maxclass": "newobj", "text": "inlet", "patching_rect": [30.0, 60.0, 35.0, 22.0], "numinlets": 1, "numoutlets": 1}},
      {"box": {"id": "obj-3", "maxclass": "newobj", "text": "js ../code/abx_test.js", "patching_rect": [30.0, 100.0, 140.0, 22.0], "numinlets": 1, "numoutlets": 2}},
      {"box": {"id": "obj-4", "maxclass": "newobj", "text": "outlet", "patching_rect": [30.0, 150.0, 40.0, 22.0], "numinlets": 1, "numoutlets": 0}},
      {"box": {"id": "obj-5", "maxclass": "newobj", "text": "outlet", "patching_rect": [120.0, 150.0, 40.0, 22.0], "numinlets": 1, "numoutlets": 0}}
    ],
    "lines": [
      {"patchline": {"source": ["obj-2", 0], "destination": ["obj-3", 0]}},
      {"patchline": {"source": ["obj-3", 0], "destination": ["obj-4", 0]}},
      {"patchline": {"source": ["obj-3", 1], "destination": ["obj-5", 0]}}
    ],
    "originid": "pat-temperamentlab-abx",
    "autosave": 0
  }
}
