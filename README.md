# TemperamentLab

TemperamentLab は、異なる音律（Temperament）を比較しながら和音の響きと粗さを直感的に検証するための Max プロジェクトです。  
ABX テスト、周波数マッピング、簡易解析（ビート成分・roughness 指標）、試行ログ記録を 1 つのコンソールで扱える構成になっています。

## 主な機能

- 複数音律の切り替え（例: `12-TET`, `Werckmeister III`, `Kirnberger III`）
- `global` / `chord_relative_just` の 2 モードで周波数マッピング
- コードタイプ、転回形、ボイシング、音色、エンベロープ等の制御
- ABX 比較テスト（A/B/X）とバッチ実行
- ビート関連ペアの抽出と roughness スコアの算出
- 試行ログの `CSV` / `JSONL` 出力

## 動作環境

- Cycling '74 Max 9 系（`patchers/main.maxpat` は Max 9.0.5 情報を保持）

## 使い方

1. Max で `TemperamentLab.maxproj` を開く。  
2. `patchers/main.maxpat` を開いて実行する。  
3. 起動時に以下がロードされることを確認する。  
   - `loadtables ../code/tuning_tables.json`  
   - `setpaths ../data/logs/trials.csv ../data/logs/trials.jsonl`
4. UI から音律・コード・ABX 設定を調整し、再生/比較/記録を行う。

## ディレクトリ構成

- `patchers/`: メイン UI と各機能パッチャー
  - `main.maxpat`: 統合コンソール
  - `tuning_engine.maxpat`, `chord_engine.maxpat`, `poly_synth.maxpat`, `analysis.maxpat`, `abx_test.maxpat`
- `code/`: ロジック実装（JavaScript）
  - `lab_controller.js`: 全体制御
  - `tuning_engine.js`: 音律マッピング
  - `analysis.js`: 解析処理
  - `abx_test.js`: ABX 試行管理
  - `logger.js`: ログ出力
  - `scala_loader.js`: Scala 形式補助
  - `tuning_tables.json`: 音律テーブル
- `data/`
  - `scales/`: スケール関連データ
  - `logs/`: 実験ログ出力先
- `other/`: 補助ファイル

## ログ出力

既定では以下へ保存されます。

- `data/logs/trials.csv`
- `data/logs/trials.jsonl`

必要に応じて `main.maxpat` 内の `setpaths` メッセージを変更してください。

## 現状メモ

- リポジトリは実験・研究向けの構成で、UI と内部パラメータは検証用途に最適化されています。
- 実運用向けにする場合は、プリセット管理やエラーハンドリングの追加を推奨します。
