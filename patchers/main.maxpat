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
      60,
      80,
      1540,
      920
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
            740,
            20
          ],
          "text": "Temperament Lab v0.5 - Structured Control Console"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "text": "loadbang",
          "patching_rect": [
            30,
            55,
            60,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "message",
          "text": "loadtables ../code/tuning_tables.json",
          "patching_rect": [
            100,
            55,
            240,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "message",
          "text": "setpaths ../data/logs/trials.csv ../data/logs/trials.jsonl",
          "patching_rect": [
            350,
            55,
            330,
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
          "text": "js ../code/lab_controller.js",
          "patching_rect": [
            100,
            95,
            190,
            22
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "varname": "temper_ctrl"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "text": "js ../code/logger.js",
          "patching_rect": [
            350,
            95,
            130,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "text": "print temperament_lab",
          "patching_rect": [
            500,
            95,
            145,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "comment",
          "patching_rect": [
            30,
            140,
            150,
            20
          ],
          "text": "Root MIDI"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "number",
          "patching_rect": [
            30,
            165,
            50,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "root_midi_ctl"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "text": "prepend setroot",
          "patching_rect": [
            90,
            165,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "comment",
          "patching_rect": [
            220,
            140,
            200,
            20
          ],
          "text": "Chord Type"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "message",
          "text": "setchord maj",
          "patching_rect": [
            220,
            165,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "message",
          "text": "setchord min",
          "patching_rect": [
            310,
            165,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "message",
          "text": "setchord dom7",
          "patching_rect": [
            400,
            165,
            92,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "message",
          "text": "setchord maj7",
          "patching_rect": [
            497,
            165,
            92,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "message",
          "text": "setchord m7b5",
          "patching_rect": [
            594,
            165,
            92,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "comment",
          "patching_rect": [
            30,
            205,
            220,
            20
          ],
          "text": "Inversion / Voicing"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "number",
          "patching_rect": [
            30,
            230,
            50,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "inversion_ctl"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "text": "prepend setinversion",
          "patching_rect": [
            90,
            230,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "message",
          "text": "setvoicing root",
          "patching_rect": [
            220,
            230,
            100,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "message",
          "text": "setvoicing open",
          "patching_rect": [
            325,
            230,
            100,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "message",
          "text": "setvoicing drop2",
          "patching_rect": [
            430,
            230,
            105,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "comment",
          "patching_rect": [
            570,
            205,
            220,
            20
          ],
          "text": "Mode"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "message",
          "text": "setmode global",
          "patching_rect": [
            570,
            230,
            95,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "message",
          "text": "setmode chord_relative_just",
          "patching_rect": [
            670,
            230,
            170,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "comment",
          "patching_rect": [
            30,
            270,
            360,
            20
          ],
          "text": "Temperament A/B (format: setab <A> | <B>)"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "message",
          "text": "setab 12-TET | Werckmeister III",
          "patching_rect": [
            30,
            295,
            220,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "message",
          "text": "setab Pythagorean | Quarter-comma Meantone",
          "patching_rect": [
            255,
            295,
            290,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "message",
          "text": "setab Just Intonation Major (C center) | 12-TET",
          "patching_rect": [
            550,
            295,
            330,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "comment",
          "patching_rect": [
            30,
            335,
            280,
            20
          ],
          "text": "ABX Controls"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "message",
          "text": "newtrial",
          "patching_rect": [
            30,
            360,
            65,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "message",
          "text": "playa",
          "patching_rect": [
            100,
            360,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "message",
          "text": "playb",
          "patching_rect": [
            155,
            360,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "message",
          "text": "playx",
          "patching_rect": [
            210,
            360,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "message",
          "text": "answer A",
          "patching_rect": [
            265,
            360,
            65,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "message",
          "text": "answer B",
          "patching_rect": [
            335,
            360,
            65,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "comment",
          "patching_rect": [
            430,
            335,
            220,
            20
          ],
          "text": "Ratings (1-7)"
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "number",
          "patching_rect": [
            430,
            360,
            40,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "rating_con_ctl"
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "newobj",
          "text": "prepend setratingconsonance",
          "patching_rect": [
            475,
            360,
            165,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "number",
          "patching_rect": [
            645,
            360,
            40,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "rating_rough_ctl"
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "text": "prepend setratingroughness",
          "patching_rect": [
            690,
            360,
            160,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "number",
          "patching_rect": [
            855,
            360,
            40,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "rating_tension_ctl"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "newobj",
          "text": "prepend setratingtension",
          "patching_rect": [
            900,
            360,
            145,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "comment",
          "patching_rect": [
            1080,
            335,
            220,
            20
          ],
          "text": "Batch ABX"
        }
      },
      {
        "box": {
          "id": "obj-115",
          "maxclass": "message",
          "text": "startbatch 20",
          "patching_rect": [
            1080,
            360,
            90,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "message",
          "text": "startbatch 50",
          "patching_rect": [
            1175,
            360,
            90,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-117",
          "maxclass": "message",
          "text": "batchstatus",
          "patching_rect": [
            1270,
            360,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "message",
          "text": "stopbatch",
          "patching_rect": [
            1360,
            360,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-134",
          "maxclass": "message",
          "text": "setbatchautoplay 1",
          "patching_rect": [
            1080,
            387,
            115,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-135",
          "maxclass": "message",
          "text": "setbatchautoplay 0",
          "patching_rect": [
            1200,
            387,
            115,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "number",
          "patching_rect": [
            1320,
            387,
            55,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-137",
          "maxclass": "newobj",
          "text": "prepend setbatchgap",
          "patching_rect": [
            1380,
            387,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "comment",
          "patching_rect": [
            1080,
            412,
            260,
            20
          ],
          "text": "Batch Stats (done/total, acc, meanRTms)"
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "newobj",
          "text": "route batch_progress_values batch_finished_values batch_status_values",
          "patching_rect": [
            1080,
            435,
            420,
            22
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "newobj",
          "text": "unpack 0 0 0. 0.",
          "patching_rect": [
            1080,
            462,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "newobj",
          "text": "unpack 0 0 0. 0.",
          "patching_rect": [
            1195,
            462,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-142",
          "maxclass": "newobj",
          "text": "unpack 0 0 0 0. 0.",
          "patching_rect": [
            1310,
            462,
            135,
            22
          ],
          "numinlets": 1,
          "numoutlets": 5,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "toggle",
          "patching_rect": [
            1080,
            490,
            20,
            20
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-144",
          "maxclass": "number",
          "patching_rect": [
            1105,
            490,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "number",
          "patching_rect": [
            1155,
            490,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "flonum",
          "patching_rect": [
            1205,
            490,
            70,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-147",
          "maxclass": "flonum",
          "patching_rect": [
            1280,
            490,
            80,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "comment",
          "patching_rect": [
            30,
            400,
            250,
            20
          ],
          "text": "Analysis params"
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "number",
          "patching_rect": [
            30,
            425,
            50,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "harmonics_ctl"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "text": "prepend setharmonics",
          "patching_rect": [
            85,
            425,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "flonum",
          "patching_rect": [
            210,
            425,
            60,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "beat_cutoff_ctl"
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "newobj",
          "text": "prepend setbeatcutoff",
          "patching_rect": [
            275,
            425,
            130,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "number",
          "patching_rect": [
            410,
            425,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "topbeats_n_ctl"
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "newobj",
          "text": "prepend settopbeatsn",
          "patching_rect": [
            460,
            425,
            130,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "comment",
          "patching_rect": [
            30,
            470,
            280,
            20
          ],
          "text": "Audio chain"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "newobj",
          "text": "js ../code/poly_router.js",
          "patching_rect": [
            30,
            495,
            150,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "newobj",
          "text": "poly~ synth_voice 8",
          "patching_rect": [
            190,
            495,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-52",
          "maxclass": "newobj",
          "text": "clip~ -0.98 0.98",
          "patching_rect": [
            320,
            495,
            105,
            22
          ],
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "text": "gain~",
          "patching_rect": [
            415,
            490,
            100,
            35
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "newobj",
          "text": "ezdac~",
          "patching_rect": [
            525,
            500,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "text": "spectroscope~",
          "patching_rect": [
            590,
            480,
            260,
            120
          ],
          "numinlets": 2,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "text": "loadmess 122",
          "patching_rect": [
            525,
            470,
            80,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "comment",
          "patching_rect": [
            30,
            540,
            290,
            20
          ],
          "text": "Manual play current temperament"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "message",
          "text": "settemperament 12-TET",
          "patching_rect": [
            30,
            565,
            140,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "message",
          "text": "settemperament Kirnberger III",
          "patching_rect": [
            175,
            565,
            180,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "message",
          "text": "play",
          "patching_rect": [
            360,
            565,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "comment",
          "patching_rect": [
            430,
            540,
            360,
            20
          ],
          "text": "Just Intonation (C center) is key-center dependent by design"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "comment",
          "patching_rect": [
            30,
            605,
            260,
            20
          ],
          "text": "Timbre: sine / additive / bright"
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "message",
          "text": "settimbre sine",
          "patching_rect": [
            30,
            630,
            95,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "message",
          "text": "settimbre additive",
          "patching_rect": [
            130,
            630,
            115,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "message",
          "text": "settimbre bright",
          "patching_rect": [
            250,
            630,
            105,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "comment",
          "patching_rect": [
            380,
            605,
            240,
            20
          ],
          "text": "ADSR + play amp/duration"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "number",
          "patching_rect": [
            380,
            630,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "attack_ctl"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "newobj",
          "text": "prepend setattack",
          "patching_rect": [
            430,
            630,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "number",
          "patching_rect": [
            540,
            630,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "decay_ctl"
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "newobj",
          "text": "prepend setdecay",
          "patching_rect": [
            590,
            630,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "flonum",
          "patching_rect": [
            695,
            630,
            55,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "sustain_ctl"
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "newobj",
          "text": "prepend setsustain",
          "patching_rect": [
            755,
            630,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "number",
          "patching_rect": [
            870,
            630,
            45,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "release_ctl"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "newobj",
          "text": "prepend setrelease",
          "patching_rect": [
            920,
            630,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-74",
          "maxclass": "flonum",
          "patching_rect": [
            1035,
            630,
            55,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "playamp_ctl"
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "newobj",
          "text": "prepend setplayamp",
          "patching_rect": [
            1095,
            630,
            115,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "number",
          "patching_rect": [
            1215,
            630,
            55,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "varname": "duration_ctl"
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "text": "prepend setduration",
          "patching_rect": [
            1275,
            630,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "comment",
          "patching_rect": [
            30,
            665,
            220,
            20
          ],
          "text": "Debug Presets (preset 1/2/3/4/5/6)"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "preset",
          "patching_rect": [
            30,
            690,
            170,
            34
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "varname": "preset_ctl"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "message",
          "patching_rect": [
            210,
            690,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 60, setinversion 0, setratingconsonance 4, setratingroughness 4, setratingtension 4, setharmonics 8, setbeatcutoff 30, settopbeatsn 5, setattack 20, setdecay 120, setsustain 0.7, setrelease 350, setplayamp 0.16, setduration 1200, setmode global, setchord maj, setvoicing root, settimbre sine, setab 12-TET | Werckmeister III",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-82",
          "maxclass": "message",
          "patching_rect": [
            210,
            715,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 60, setinversion 0, setratingconsonance 4, setratingroughness 5, setratingtension 5, setharmonics 10, setbeatcutoff 40, settopbeatsn 5, setattack 10, setdecay 90, setsustain 0.6, setrelease 220, setplayamp 0.20, setduration 900, setmode global, setchord maj7, setvoicing root, settimbre bright, setab Pythagorean | Quarter-comma Meantone",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "message",
          "patching_rect": [
            210,
            740,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 55, setinversion 1, setratingconsonance 5, setratingroughness 3, setratingtension 3, setharmonics 12, setbeatcutoff 30, settopbeatsn 5, setattack 30, setdecay 180, setsustain 0.75, setrelease 500, setplayamp 0.17, setduration 1600, setmode global, setchord min7, setvoicing open, settimbre additive, setab Just Intonation Major (C center) | 12-TET",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "message",
          "patching_rect": [
            535,
            690,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "1",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "message",
          "patching_rect": [
            575,
            690,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "2",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "message",
          "patching_rect": [
            615,
            690,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "3",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-87",
          "maxclass": "newobj",
          "text": "sel 1 2 3 4 5 6",
          "patching_rect": [
            655,
            690,
            120,
            22
          ],
          "numinlets": 1,
          "numoutlets": 7,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "message",
          "patching_rect": [
            730,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 1",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "message",
          "patching_rect": [
            790,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 2",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "message",
          "patching_rect": [
            850,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 3",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            720,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 40",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "newobj",
          "patching_rect": [
            790,
            720,
            50,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 80",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "newobj",
          "patching_rect": [
            850,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 120",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 160",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "newobj",
          "patching_rect": [
            970,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 200",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "newobj",
          "patching_rect": [
            1030,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 240",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-97",
          "maxclass": "newobj",
          "patching_rect": [
            1090,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 560",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "message",
          "patching_rect": [
            210,
            765,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 62, setinversion 0, setratingconsonance 4, setratingroughness 4, setratingtension 5, setharmonics 9, setbeatcutoff 30, settopbeatsn 5, setattack 18, setdecay 130, setsustain 0.65, setrelease 320, setplayamp 0.21, setduration 1100, setmode global, setchord dom7, setvoicing root, settimbre bright, setab Werckmeister III | Kirnberger III",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-120",
          "maxclass": "message",
          "patching_rect": [
            210,
            790,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 57, setinversion 2, setratingconsonance 3, setratingroughness 6, setratingtension 6, setharmonics 12, setbeatcutoff 45, settopbeatsn 5, setattack 8, setdecay 80, setsustain 0.55, setrelease 260, setplayamp 0.18, setduration 900, setmode global, setchord dim, setvoicing root, settimbre additive, setab Quarter-comma Meantone | 12-TET",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "message",
          "patching_rect": [
            210,
            815,
            700,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "setroot 60, setinversion 1, setratingconsonance 5, setratingroughness 2, setratingtension 3, setharmonics 8, setbeatcutoff 30, settopbeatsn 5, setattack 25, setdecay 160, setsustain 0.8, setrelease 600, setplayamp 0.16, setduration 1800, setmode global, setchord maj, setvoicing open, settimbre sine, setab Just Intonation Minor (C center) | Just Intonation Major (C center)",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-122",
          "maxclass": "message",
          "patching_rect": [
            655,
            715,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "4",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "message",
          "patching_rect": [
            695,
            715,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "5",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "message",
          "patching_rect": [
            735,
            715,
            35,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "6",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-125",
          "maxclass": "message",
          "patching_rect": [
            910,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 4",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "message",
          "patching_rect": [
            970,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 5",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-127",
          "maxclass": "message",
          "patching_rect": [
            1030,
            690,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "store 6",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-128",
          "maxclass": "newobj",
          "patching_rect": [
            1150,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 320",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-129",
          "maxclass": "newobj",
          "patching_rect": [
            1210,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 360",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-130",
          "maxclass": "newobj",
          "patching_rect": [
            1270,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 400",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "newobj",
          "patching_rect": [
            1330,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 440",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-132",
          "maxclass": "newobj",
          "patching_rect": [
            1390,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 480",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            720,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "delay 520",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-98",
          "maxclass": "comment",
          "patching_rect": [
            930,
            20,
            230,
            20
          ],
          "text": "Analysis Visualization"
        }
      },
      {
        "box": {
          "id": "obj-99",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            45,
            300,
            22
          ],
          "numinlets": 1,
          "numoutlets": 4,
          "text": "route beat_energy roughness_score top_beats_hz"
        }
      },
      {
        "box": {
          "id": "obj-100",
          "maxclass": "comment",
          "patching_rect": [
            930,
            72,
            110,
            20
          ],
          "text": "BeatEnergy"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "flonum",
          "patching_rect": [
            1040,
            72,
            90,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-102",
          "maxclass": "comment",
          "patching_rect": [
            930,
            98,
            130,
            20
          ],
          "text": "RoughnessScore"
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "flonum",
          "patching_rect": [
            1040,
            98,
            90,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "comment",
          "patching_rect": [
            930,
            126,
            180,
            20
          ],
          "text": "Top 5 Beats (Hz)"
        }
      },
      {
        "box": {
          "id": "obj-105",
          "maxclass": "multislider",
          "patching_rect": [
            930,
            150,
            260,
            100
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "size": 5,
          "setminmax": [
            0,
            50
          ]
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "comment",
          "patching_rect": [
            930,
            255,
            230,
            20
          ],
          "text": "Use Top 5 + scores for quick comparison"
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "message",
          "text": "setprofile teaching",
          "patching_rect": [
            300,
            655,
            120,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "obj-149",
          "maxclass": "message",
          "text": "setprofile experiment",
          "patching_rect": [
            425,
            655,
            130,
            22
          ],
          "numinlets": 2,
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
            "obj-2",
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
            "obj-2",
            0
          ],
          "destination": [
            "obj-91",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-92",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-93",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-94",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-95",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-96",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-97",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-128",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-129",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-130",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-131",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-132",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-133",
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
            "obj-4",
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
            "obj-5",
            0
          ],
          "destination": [
            "obj-50",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            1
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
            "obj-5",
            1
          ],
          "destination": [
            "obj-99",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            2
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
            "obj-5",
            2
          ],
          "destination": [
            "obj-139",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            3
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
            "obj-9",
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
            "obj-10",
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
            "obj-12",
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
            "obj-13",
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
            "obj-14",
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
            "obj-15",
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
            "obj-16",
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
            "obj-18",
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
            "obj-19",
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
            "obj-20",
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
            "obj-21",
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
            "obj-22",
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
            "obj-24",
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
            "obj-25",
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
            "obj-27",
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
            "obj-28",
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
            "obj-29",
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
            "obj-31",
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
            "obj-32",
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
            "obj-33",
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
            "obj-34",
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
            "obj-35",
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
            "obj-36",
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
            "obj-115",
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
            "obj-116",
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
            "obj-117",
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
            "obj-118",
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
            "obj-134",
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
            "obj-135",
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
            "obj-136",
            0
          ],
          "destination": [
            "obj-137",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-137",
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
            "obj-38",
            0
          ],
          "destination": [
            "obj-39",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-39",
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
            "obj-40",
            0
          ],
          "destination": [
            "obj-41",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-41",
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
            "obj-42",
            0
          ],
          "destination": [
            "obj-43",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-43",
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
            "obj-45",
            0
          ],
          "destination": [
            "obj-46",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-46",
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
            "obj-47",
            0
          ],
          "destination": [
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-48",
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
            "obj-106",
            0
          ],
          "destination": [
            "obj-107",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-107",
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
            "obj-50",
            0
          ],
          "destination": [
            "obj-51",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-51",
            0
          ],
          "destination": [
            "obj-52",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-52",
            0
          ],
          "destination": [
            "obj-53",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-78",
            0
          ],
          "destination": [
            "obj-53",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-53",
            0
          ],
          "destination": [
            "obj-54",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-53",
            1
          ],
          "destination": [
            "obj-54",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-52",
            0
          ],
          "destination": [
            "obj-55",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-52",
            0
          ],
          "destination": [
            "obj-55",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-57",
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
            "obj-58",
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
            "obj-59",
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
            "obj-62",
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
            "obj-63",
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
            "obj-64",
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
            "obj-66",
            0
          ],
          "destination": [
            "obj-67",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-67",
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
            "obj-68",
            0
          ],
          "destination": [
            "obj-69",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-69",
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
            "obj-70",
            0
          ],
          "destination": [
            "obj-71",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-71",
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
            "obj-72",
            0
          ],
          "destination": [
            "obj-73",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-73",
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
            "obj-74",
            0
          ],
          "destination": [
            "obj-75",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-75",
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
            "obj-76",
            0
          ],
          "destination": [
            "obj-77",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-77",
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
            "obj-84",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-85",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-86",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-122",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-123",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-124",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-80",
            1
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-84",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-85",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-86",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-122",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-123",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-124",
            0
          ],
          "destination": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            0
          ],
          "destination": [
            "obj-81",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            1
          ],
          "destination": [
            "obj-82",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            2
          ],
          "destination": [
            "obj-83",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            3
          ],
          "destination": [
            "obj-119",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            4
          ],
          "destination": [
            "obj-120",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-87",
            5
          ],
          "destination": [
            "obj-121",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-81",
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
            "obj-82",
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
            "obj-83",
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
            "obj-119",
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
            "obj-120",
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
            "obj-121",
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
            "obj-91",
            0
          ],
          "destination": [
            "obj-84",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-92",
            0
          ],
          "destination": [
            "obj-88",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-88",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-93",
            0
          ],
          "destination": [
            "obj-85",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-94",
            0
          ],
          "destination": [
            "obj-89",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-89",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-95",
            0
          ],
          "destination": [
            "obj-86",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-96",
            0
          ],
          "destination": [
            "obj-90",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-90",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-128",
            0
          ],
          "destination": [
            "obj-122",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-129",
            0
          ],
          "destination": [
            "obj-125",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-125",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-130",
            0
          ],
          "destination": [
            "obj-123",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-131",
            0
          ],
          "destination": [
            "obj-126",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-126",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-132",
            0
          ],
          "destination": [
            "obj-124",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-133",
            0
          ],
          "destination": [
            "obj-127",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-127",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-97",
            0
          ],
          "destination": [
            "obj-84",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-99",
            0
          ],
          "destination": [
            "obj-101",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-99",
            1
          ],
          "destination": [
            "obj-103",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-99",
            2
          ],
          "destination": [
            "obj-105",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-139",
            0
          ],
          "destination": [
            "obj-140",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-139",
            1
          ],
          "destination": [
            "obj-141",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-139",
            2
          ],
          "destination": [
            "obj-142",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-140",
            0
          ],
          "destination": [
            "obj-144",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-140",
            1
          ],
          "destination": [
            "obj-145",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-140",
            2
          ],
          "destination": [
            "obj-146",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-140",
            3
          ],
          "destination": [
            "obj-147",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-141",
            0
          ],
          "destination": [
            "obj-144",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-141",
            1
          ],
          "destination": [
            "obj-145",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-141",
            2
          ],
          "destination": [
            "obj-146",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-141",
            3
          ],
          "destination": [
            "obj-147",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-142",
            0
          ],
          "destination": [
            "obj-143",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-142",
            1
          ],
          "destination": [
            "obj-144",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-142",
            2
          ],
          "destination": [
            "obj-145",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-142",
            3
          ],
          "destination": [
            "obj-146",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-142",
            4
          ],
          "destination": [
            "obj-147",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-148",
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
            "obj-149",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      }
    ],
    "originid": "pat-temperamentlab-main-v2",
    "autosave": 0
  }
}