rem バッチファイルの存在するディレクトリを取得（末尾の\を含む）
set "CURRENT_DIR=%~dp0"

rem カレントディレクトリ名（このbatファイルが置かれているフォルダ名、例: 4.5）を取得
for %%I in ("%CURRENT_DIR:~0,-1%") do set "VERSION_NAME=%%~nxI"

rem それぞれのディレクトリをバッチファイルと同階層のフォルダに設定
set "BLENDER_USER_CONFIG=%CURRENT_DIR%config"
set "BLENDER_USER_SCRIPTS=%CURRENT_DIR%scripts"
set "BLENDER_USER_DATAFILES=%CURRENT_DIR%datafiles"
set "BLENDER_USER_EXTENSIONS=%CURRENT_DIR%extensions"

rem 取得したフォルダ名（バージョン）を利用してBlenderを起動
start "" "C:\Program Files\Blender Foundation\Blender %VERSION_NAME%\blender.exe"