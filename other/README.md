# Temperament Lab (Max/MSP)

用于对比不同音律/调律下和弦听感差异（A/B/ABX + 拍频 + 粗糙度 + 日志）。

## 当前状态
- `v0.4`：控制、播放、ABX、日志、内置 preset、可视化已打通。
- 三档音色：`sine / additive / bright`。
- 统一 ADSR：`attack / decay / sustain / release`。
- 内置 7 种音律表（含 12-TET）。

## 关键说明
- `Just Intonation ... (C center)` 是 C 中心纯律，转调崩坏是预期。
- `setmode chord_relative_just` 会让和弦内更纯，但换和弦会跳频。

## 目录
- `patchers/main.maxpat`: 主控制台
- `code/lab_controller.js`: 统一控制与分析输出
- `code/poly_router.js`: 频率分配到 `poly~`
- `code/tuning_tables.json`: 音律表
- `data/logs/`: 实验日志输出

## 快速开始
1. 打开 `TemperamentLab.maxproj`，再打开 `patchers/main.maxpat`。
2. 打开 `ezdac~`。
3. 点 `preset` 槽位 `1/2/3/4/5/6`。
4. 点 `playa` 或 `play`。

## 批量 ABX
- `startbatch 20`：开始 20 轮 ABX
- `startbatch 50`：开始 50 轮 ABX
- `setbatchautoplay 1/0`：批量时自动播放 A->B->X（默认 1）
- `setbatchgap <ms>`：自动播放间隔（默认约 900ms）
- `batchstatus`：查看当前进度/正确率/平均反应时
- `stopbatch`：中止当前批量测试
- 批量过程中每次 `answer A/B` 后会自动进入下一轮，直到完成。

## main 控件说明
- Root/Chord/Inversion/Voicing：和弦条件
- `setmode global | chord_relative_just`
- `setab <A> | <B>`：AB 对照音律
- Ratings（1-7）：`Consonance / Roughness / Tension`
- Analysis params：`harmonics`、`beat cutoff`
- Top beats 数量：`settopbeatsn`（1~20，默认 5）
- Timbre：`settimbre sine|additive|bright`
- ADSR：`setattack / setdecay / setsustain / setrelease`
- Playback：`setplayamp / setduration`
- `settemperament ...` + `play`：单一音律手动播放
- Batch Stats 面板：显示 active/done/total/accuracy/meanRT

## 日志字段
- 当前日志已额外记录：`mode`、`topbeatsn`、`attack_ms`、`decay_ms`、`sustain`、`release_ms`、`play_amp`、`duration_ms`。

## Debug Presets
- 内置 6 个槽位，启动会自动写入。
- 直接点击 `preset` 圆点 `1/2/3/4/5/6` 即可召回。
- 槽 1：基础稳定（sine）
- 槽 2：bright 快速包络
- 槽 3：additive 长包络（global 对照）
- 槽 4：Werckmeister/Kirnberger 对照（dom7）
- 槽 5：Meantone 紧张对照（dim）
- 槽 6：Just minor/major 对照（global，open voicing）

## 可视化
主界面右上角 `Analysis Visualization`：
- `BeatEnergy`
- `RoughnessScore`
- `Top 5 Beats (Hz)`（multislider，可通过 `settopbeatsn` 调整）
