# Temperament Lab 实验课使用版

## 1. 课前准备（约 2 分钟）
1. 打开 `TemperamentLab.maxproj`，再打开 `patchers/main.maxpat`。
2. 打开 `ezdac~`。
3. 点击 `preset 1`，确认可以听到声音。
4. 检查可视化区域是否有：
- `BeatEnergy`
- `RoughnessScore`
- `Top 5 Beats (Hz)`

## 2. 教师演示流程（约 10 分钟）
### 演示 A：同和弦不同调律
1. 保持：`Root MIDI=60`，`Chord=maj`，`Voicing=root`。
2. 设置 `setab 12-TET | Werckmeister III`。
3. 依次点 `playa`、`playb`。
4. 引导学生观察：
- 听感差异（甜/紧/粗糙）
- `BeatEnergy` 与 `RoughnessScore` 数值变化
- `Top 5 Beats` 峰值位置

### 演示 B：纯律的语境问题
1. 点击 `preset 6`（Just 对照）。
2. 保持 `global` 模式，点 `playa`、`playb`。
3. 说明：C-center 纯律在不同语境下并不总是“最纯”。

### 演示 C：音色对差异感知的影响
1. 分别点 `settimbre sine / additive / bright`。
2. 每次点 `playa`。
3. 对比不同音色下拍频和粗糙感是否更容易被听出。

## 3. 学生分组实验（约 20 分钟）
每组建议 2-3 人，分工：操作员 / 记录员 / 听辨者。

### 任务 1：ABX 快速测试（10 轮）
1. 设置 `setbatchautoplay 1`。
2. 选择一个 preset（建议 1 或 4）。
3. 点 `startbatch 20`，每组做其中 10 轮即可。
4. 每轮只做：听 A/B/X -> 点 `answer A/B`。
5. 记录：
- 正确率（accuracy）
- 平均反应时（meanRT）

### 任务 2：参数影响对比
每组至少改两个参数并记录变化：
- `harmonics`
- `beat cutoff`
- `voicing`
- `timbre`
观察 `BeatEnergy / RoughnessScore / Top 5` 的变化方向。

## 4. 课后数据导出与分析
日志文件位置：
- `data/logs/trials.csv`
- `data/logs/trials.jsonl`

课堂建议分析项：
1. 不同调律对下的平均正确率
2. 不同音色下的平均反应时
3. `BeatEnergy` 与主观 `Roughness` 评分是否同向变化

## 5. 课堂快速排错
1. 没声音
- 确认 `ezdac~` 已打开
- 确认 `gain~` 不在最低
- 先点 `preset 1` 再点 `playa`

2. 可视化不更新
- 先点一次 `playa` 或 `playb`
- 确认在 `global` 模式下做 A/B 对比

3. 批量 ABX 没自动播放
- 检查 `setbatchautoplay 1`
- 检查 `setbatchgap`（建议 700~1200ms）

4. 日志没有写入
- 检查 `data/logs/` 是否存在
- 看 Max Console 是否出现 `logged` 提示

## 6. 一页课堂口令（可投屏）
1. `preset 1`
2. `setab 12-TET | Werckmeister III`
3. `playa -> playb`
4. `setbatchautoplay 1`
5. `startbatch 20`
6. 学生只点：`answer A/B`
