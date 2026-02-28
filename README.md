# Blender Launcher

Blenderをバッチファイル経由で起動し、ユーザー設定（Preferences、アドオンやスタートアップファイル等）の保存ディレクトリを完全に分離・独立させるためのランチャーです。

プロジェクトごとや、バージョンごとにクリーンな状態のBlender環境を構築・共有することができます。

## 主な特徴
- **環境の独立化**: 実行ファイルの置かれた親フォルダ名をバージョンとして自動で読み取り、その同じディレクトリ内に `config`, `scripts`, `datafiles`, `extensions` を展開し、専用のユーザー環境として起動します。
- **バージョンの一括管理**: `version` フォルダ配下にバージョン番号のフォルダを作成し、その中にバッチファイルを置くだけで利用可能です。

## ディレクトリ構成
```text
blender_launcher/
  ├─ README.md
  └─ version/
       └─ 4.5/                 <-- フォルダ名がBlenderのバージョンを表します
           ├─ blender.bat      <-- 起動用バッチファイル
           ├─ config/          <-- ユーザー設定ファイル群（環境設定・スタートアップファイル）
           ├─ scripts/         <-- ユーザー追加のアドオンやスクリプト
           ├─ datafiles/       <-- 一部のデータファイル領域
           └─ extensions/      <-- 拡張機能（Blender 4.2+ 以降）
```
※各フォルダ（`config`など）はバッチファイル起動時に自動的に読み込まれます。

## 使い方
1. 本リポジトリをお好みの場所へ配置します。
2. 起動したいBlenderのバージョンに合わせて、`version/` 配下にフォルダを作成します。（例: `4.5` など）
3. 該当のフォルダへ `blender.bat` をコピーまたは配置します。
4. `blender.bat` をダブルクリックして実行すると、インストール先の `C:\Program Files\Blender Foundation\Blender <バージョン名>\blender.exe` が指定されたローカルディレクトリの設定を参照して起動します。

## 既知の制約事項 / 注意点
- 標準のインストール先である `C:\Program Files\Blender Foundation\Blender <バージョン名>\blender.exe` にBlenderがインストールされていることを前提としています。
  - Dドライブなどの別ドライブ、またはポータブル版など標準と異なるパスを使用している場合は、`blender.bat` 内の後段にある `start ""` で始まる起動パスを適切な場所へ書き換えてください。

## その他の環境変数の設定について
`blender.bat` 内では、ユーザー固有の設定フォルダを指定するために環境変数（`BLENDER_USER_CONFIG` など）を割り当ててBlenderを起動しています。
他にもさまざまな環境変数を指定してBlenderの起動時の挙動を制御することが可能です。
詳細な環境変数の種類と仕様については、以下の公式ドキュメント（コマンドライン引数 - 環境変数）を参照してください。

[Blender Manual: Command Line Arguments - Environment Variables](https://docs.blender.org/manual/en/4.5/advanced/command_line/arguments.html#command-line-args-environment-variables)
