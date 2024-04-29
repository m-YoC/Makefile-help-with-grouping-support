# Makefileのhelpを表示する奴のグループ分け表示対応版

<p align="center">
  <img src="./image.png" alt="いめーじ" width="500" />
</p>

Makefile helpで検索するとよく出てくる奴のグループ分け表示に対応したバージョンです．  
awkプログラムが複雑化しhelpのコマンドがワンライナーとしては長大になってしまったためawkファイルに分割しています．  
使用する場合はご了承ください．

## Install

#### mfhelp.awkをインストールする
```bash
wget --no-check-certificate https://raw.githubusercontent.com/m-YoC/Makefile-help-with-grouping-support/main/mfhelp.awk
```

#### Makefileにhelpを設定する
```Makefile
.DEFAULT_GOAL := help
help: ## Display this help screen
	@sed -n 2p mfhelp.awk | cut -c 2- | xargs -i grep -E '{}' $(MAKEFILE_LIST) | awk -f mfhelp.awk
```

## usage

[Makefileのサンプルを参照](./Makefile)

Makefile内のhelp部分をコピペしてください．`mfhelp.awk`ファイルをMakefileと同階層に入れてください．

### コマンドの説明コメント

よくある奴です．  
`command: ## description`

- `command: ## description #> subtext1 #> subtext2 ...`とすることで補足文を加えることができます．

### グループコメント

`###>`がグループ分け関連のコメント記法です．スペースなどは入れず，記述行の先頭に配置してください．
- `###> [command group comment]`でグループコメントを記述できます．
    - 同時に以降のコマンド行がグループ表示モードになります．
    - グループコメントを`!`で始めた場合は**ボールド体**になります．
- `###> @`で始めると以降のグループ表示モードを停止できます．同じ行のコメントは表示されません．
- `###>`単体は改行として機能します．
    - この場合グループ表示モードは`###> @`と同様に停止されます．

>[!NOTE]
>コマンドとその説明が表示される行をコマンド行と呼称しています．  
>`\_ `が行頭に付く場合をグループ表示モードと呼称しています．

#### コマンド行の幅の変更

helpのawkコマンドの最後に`cmdw=<width>`を追記してください．このとき`-v`オプションは使用しないでください．
