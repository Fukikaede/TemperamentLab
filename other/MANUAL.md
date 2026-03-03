# Temperament Lab 使用说明手册

## 1. 项目结构
- 主工程：`TemperamentLab.maxproj`
- 主界面：`patchers/main.maxpat`
- 核心控制脚本：`code/lab_controller.js`
- 发声路由脚本：`code/poly_router.js`
- 日志脚本：`code/logger.js`
- 调律表：`code/tuning_tables.json`
- 项目概述：`README.md`

## 2. 快速开始
1. 打开 `TemperamentLab.maxproj`。
2. 打开 `patchers/main.maxpat`。
3. 打开 `ezdac~`（必须）。
4. 点击 preset 槽位 `1~6` 之一。
5. 点击 `playa` 或 `play`。

## 3. 主界面功能（main.maxpat）
### 3.1 和弦与调律
- `Root MIDI`：根音 MIDI（例如 60=C4）
- `Chord Type`：`maj/min/dom7/maj7/m7b5` 等
- `Inversion / Voicing`：转位与 `root/open/drop2`
- `Mode`：
  - `global`：按调律表映射（推荐 A/B 对比）
  - `chord_relative_just`：和弦内部纯律（A/B 差异通常变小）
- `setab <A> | <B>`：设置 ABX 对照调律

### 3.2 ABX 控制
- `newtrial`：生成新试次
- `playa / playb / playx`：播放 A/B/X
- `answer A / answer B`：提交判断

### 3.3 主观评分
- `Consonance`（协和感）
- `Roughness`（粗糙感）
- `Tension`（紧张感）

### 3.4 分析参数
- `harmonics`：分析谐波数量
- `beat cutoff`：拍频统计上限（Hz）
- `settopbeatsn`：Top beats 数量（1~20，默认 5）

### 3.5 音色与包络
- `settimbre sine|additive|bright`
- ADSR：`setattack / setdecay / setsustain / setrelease`
- 播放参数：`setplayamp / setduration`

### 3.6 批量 ABX
- `startbatch 20` / `startbatch 50`
- `setbatchautoplay 1/0`：是否自动播放 A->B->X（默认 1）
- `setbatchgap <ms>`：自动播放间隔（默认约 900ms）
- `batchstatus`
- `stopbatch`
- `Batch Stats` 面板显示：`active / done / total / accuracy / meanRT`

### 3.7 可视化
右上角 `Analysis Visualization`：
- `BeatEnergy`
- `RoughnessScore`
- `Top 5 Beats (Hz)`（multislider）

## 4. 内置调律
来自 `code/tuning_tables.json`：
- `12-TET`
- `Werckmeister III`
- `Kirnberger III`
- `Quarter-comma Meantone`
- `Pythagorean`
- `Just Intonation Major (C center)`
- `Just Intonation Minor (C center)`

说明：
- `Just ... (C center)` 是以 C 为中心的全局纯律表。
- 转调后“纯度崩坏”是调律特性，不是程序错误。

## 5. 发声系统
由 `code/poly_router.js` + `patchers/synth_voice.maxpat` 实现：
- 最多 8 声部（poly~）
- 三种音色：sine / additive / bright
- 统一 ADSR
- 输出链路：`clip~ -> gain~ -> ezdac~`

## 6. 日志输出
输出文件：
- `data/logs/trials.csv`
- `data/logs/trials.jsonl`

记录字段包括：
- 试次信息：`trial_id, temperament_A/B, X_is, user_choice, correct, rt_ms`
- 上下文：`root_midi, chord_id, voicing, timbre, mode`
- 参数：`topbeatsn, attack_ms, decay_ms, sustain, release_ms, play_amp, duration_ms`
- 评分：`rating_consonance, rating_roughness, rating_tension`
- 指标：`beat_energy, roughness_score`

## 7. 6 个内置 Preset
- 槽 1：基础稳定（sine）
- 槽 2：bright 快速包络
- 槽 3：additive 长包络（global）
- 槽 4：Werckmeister/Kirnberger 对照（dom7）
- 槽 5：Meantone 紧张对照（dim）
- 槽 6：Just minor/major 对照（global，open voicing）

## 8. 其他模块（可单独测试）
- `patchers/tuning_engine.maxpat` + `code/tuning_engine.js`
- `patchers/chord_engine.maxpat` + `code/chord_engine.js`
- `patchers/analysis.maxpat` + `code/analysis.js`
- `patchers/abx_test.maxpat` + `code/abx_test.js`
- `code/scala_loader.js`（已可解析 `.scl`，尚未完整接入主界面）

## 9. 常见问题排查
1. 没声音
- 检查 `ezdac~` 是否打开
- 检查 `gain~` 是否过低
- 检查是否点击了 `play/playa/playb/playx`

2. 可视化变化很小
- 优先用 `global` 模式做 A/B
- `chord_relative_just` 模式下 A/B 差异可能明显减弱

3. 日志没写入
- 检查 console 是否有 `setpaths` / `logged`
- 检查 `data/logs` 目录是否可写

4. 调律加载失败
- 主界面默认读取 `../code/tuning_tables.json`
- 确认文件存在于 `code/tuning_tables.json`


Temperament Lab 使用说明手册（当前版本）

  1. 项目结构

  - 主工程：TemperamentLab.maxproj
  - 主界面（你实际要用的）：main.maxpat
  - 核心控制脚本：lab_controller.js
  - 发声路由脚本：poly_router.js
  - 日志脚本：logger.js
  - 调律表：tuning_tables.json
  - 说明文件：README.md

  2. 你应该从哪里开始

  1. 打开 TemperamentLab.maxproj。
  2. 打开 main.maxpat。
  3. 打开 ezdac~（必须打开，不然无声）。
  4. 点击 preset 槽位 1~6 之一。
  5. 点击 playa 或 play 听声音。

  3. 主界面功能总览（main.maxpat）

  - Root MIDI：根音 MIDI（如 60=C4）。
  - Chord Type：maj/min/dom7/maj7/m7b5 等。
  - Inversion / Voicing：转位与 root/open/drop2。
  - Mode：
      - global：按调律表映射（A/B 对比最直观）。
      - chord_relative_just：和弦内部纯律比值（A/B 差异会变小）。
  - Temperament A/B：setab A | B 设置 ABX 对照。
  - ABX Controls：newtrial / playa / playb / playx / answer A / answer B。
  - Ratings：主观评分（协和、粗糙、紧张）。
  - Analysis params：
      - harmonics：参与分析的谐波数。
      - beat cutoff：拍频统计上限 Hz。
      - topbeats_n：Top beats 数量（1~20，默认 5）。
  - Timbre：sine / additive / bright。
  - ADSR + play：attack/decay/sustain/release/playamp/duration。
  - Batch ABX：
      - startbatch 20/50
      - setbatchautoplay 1/0
      - setbatchgap
      - batchstatus
      - stopbatch
  - Batch Stats：显示 active/done/total/accuracy/meanRT。
  - Analysis Visualization：
      - BeatEnergy
      - RoughnessScore
      - Top 5 Beats (Hz) 条形图

  4. 调律系统（已内置）
  来自 tuning_tables.json：

  - 12-TET
  - Werckmeister III
  - Kirnberger III
  - Quarter-comma Meantone
  - Pythagorean
  - Just Intonation Major (C center)
  - Just Intonation Minor (C center)

  注意：

  - Just ... (C center) 是“C中心表”，转调不再纯是特性不是 bug。
  - chord_relative_just 是另一种逻辑，不等同于上面 C-center 全局表。

  5. 发声系统
  由 poly_router.js + synth_voice.maxpat 实现：

  - 最多 8 声部（poly~）。
  - 每次播放发消息格式：
      - freq amp mode attack decay sustain release gate
  - 三种音色模式：
      - 1=sine
      - 2=additive
      - 3=bright
  - ADSR 用 adsr~ 统一处理。
  - 输出链路：clip~ -> gain~ -> ezdac~，防爆音。

  6. ABX 与批量实验
  单次：

  1. newtrial
  2. playa、playb、playx
  3. answer A/B
  4. 看 console + 可视化 + 日志

  批量：

  1. setbatchautoplay 1（建议）
  2. setbatchgap 900（可改）
  3. startbatch 20 或 startbatch 50
  4. 每轮只需 answer A/B
  5. 看 Batch Stats 或 batchstatus

  7. 日志与数据输出
  由 logger.js 写出：

  - CSV：/Users/kaede/Codex/TemperamentLab/data/logs/trials.csv
  - JSONL：/Users/kaede/Codex/TemperamentLab/data/logs/trials.jsonl

  当前记录字段包括：

  - 基础试验字段：trial_id、A/B、X、choice、correct、rt_ms
  - 音乐上下文：root_midi、chord_id、voicing、timbre、mode
  - 参数：topbeatsn、attack/decay/sustain/release、play_amp、duration_ms
  - 评分：rating_consonance、rating_roughness、rating_tension
  - 指标：beat_energy、roughness_score

  8. 6 组内置 Preset（主界面可直接点）

  - 槽1：基础稳定（sine）
  - 槽2：bright 快速包络
  - 槽3：additive 长包络（global）
  - 槽4：Werckmeister vs Kirnberger（dom7）
  - 槽5：Meantone 紧张场景（dim）
  - 槽6：Just minor vs Just major（global，open）

  9. 其它 patcher / 脚本（附属模块）
  这些是可单独测试的模块，不是日常主入口：

  - tuning_engine.maxpat + tuning_engine.js
  - chord_engine.maxpat + chord_engine.js
  - analysis.maxpat + analysis.js
  - abx_test.maxpat + abx_test.js
  - scala_loader.js（已可解析 .scl，但未接完整主界面流程）

  10. 常见问题排查

  1. 没声音

  - ezdac~ 是否打开
  - gain~ 是否过低
  - 是否点过 play/playa/playb/playx

  2. 可视化不变

  - 确认在 global 模式下做 A/B 对比
  - chord_relative_just 下 A/B 差异可能显著减小

  3. 日志没写

  - 看 console 是否有 setpaths/logged 输出
  - 检查 data/logs 目录是否存在写权限

  4. 调律加载失败

  - 主界面应从 ../code/tuning_tables.json 读取
  - 当前文件位置已是 code/tuning_tables.json

  ———
