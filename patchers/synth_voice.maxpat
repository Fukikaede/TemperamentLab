{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 5,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      80,
      120,
      1280,
      760
    ],
    "gridsize": [
      15,
      15
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "patching_rect": [
            30,
            20,
            640,
            20
          ],
          "text": "synth_voice v2: freq amp mode attack decay sustain release gate -> selected timbre * ADSR * amp"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "text": "in 1",
          "patching_rect": [
            30,
            60,
            35,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "text": "unpack 0. 0. 0 0. 0. 0. 0. 0",
          "patching_rect": [
            30,
            95,
            220,
            22
          ],
          "numinlets": 1,
          "numoutlets": 8
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            30,
            145,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "text": "phasor~",
          "patching_rect": [
            500,
            145,
            58,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "text": "*~ 2.",
          "patching_rect": [
            500,
            180,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "text": "-~ 1.",
          "patching_rect": [
            500,
            215,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "text": "* 2.",
          "patching_rect": [
            120,
            145,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "text": "* 3.",
          "patching_rect": [
            120,
            175,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "text": "* 4.",
          "patching_rect": [
            120,
            205,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "text": "* 5.",
          "patching_rect": [
            120,
            235,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            180,
            145,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            180,
            175,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            180,
            205,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            180,
            235,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            250,
            145,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "text": "*~ 0.333",
          "patching_rect": [
            250,
            175,
            65,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "text": "*~ 0.25",
          "patching_rect": [
            250,
            205,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "text": "*~ 0.2",
          "patching_rect": [
            250,
            235,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            330,
            165,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            370,
            190,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            410,
            215,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "text": "*~ 0.7",
          "patching_rect": [
            450,
            215,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "text": "selector~ 3",
          "patching_rect": [
            580,
            245,
            75,
            22
          ],
          "numinlets": 4,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "text": "adsr~ 20 120 0.7 350",
          "patching_rect": [
            580,
            300,
            130,
            22
          ],
          "numinlets": 5,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            580,
            335,
            40,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "text": "sig~",
          "patching_rect": [
            690,
            335,
            40,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            580,
            370,
            40,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "newobj",
          "text": "out~ 1",
          "patching_rect": [
            580,
            410,
            50,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "text": "clip 1 3",
          "patching_rect": [
            580,
            145,
            55,
            22
          ],
          "numinlets": 3,
          "numoutlets": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-10",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-12",
            0
          ],
          "destination": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-13",
            0
          ],
          "destination": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
            0
          ],
          "destination": [
            "obj-20",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            0
          ],
          "destination": [
            "obj-21",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-21",
            0
          ],
          "destination": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-22",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-22",
            0
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-23",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            2
          ],
          "destination": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-30",
            0
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-24",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-23",
            0
          ],
          "destination": [
            "obj-24",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-7",
            0
          ],
          "destination": [
            "obj-24",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            7
          ],
          "destination": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            3
          ],
          "destination": [
            "obj-25",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            4
          ],
          "destination": [
            "obj-25",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            5
          ],
          "destination": [
            "obj-25",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            6
          ],
          "destination": [
            "obj-25",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-24",
            0
          ],
          "destination": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-25",
            0
          ],
          "destination": [
            "obj-26",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-26",
            0
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            1
          ],
          "destination": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-27",
            0
          ],
          "destination": [
            "obj-28",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-28",
            0
          ],
          "destination": [
            "obj-29",
            0
          ]
        }
      }
    ],
    "originid": "pat-temperamentlab-synthvoice-v2",
    "autosave": 0
  }
}
