# movingavg

![test](https://github.com/komatuzaki/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から1行ずつ読み込んだ数値の移動平均を計算し，標準出力へ出力するコマンドです．

## インストール方法

```bash
$ git clone [https://github.com/komatuzaki/robosys2026.git](https://github.com/komatuzaki/robosys2026.git)
$cd robosys2026
$ chmod +x movingavg
```

## 使い方

標準入力に数値を1行ずつ渡して実行します．引数に正の整数を指定すると，移動平均を計算するウィンドウ幅を変更できます（省略時は `3`）．

```bash
$ ./movingavg [ウィンドウ幅]
```

### 実行例

デフォルト（ウィンドウ幅 `3`）で実行する場合：

```bash
$ printf "10\n20\n30\n40\n" | ./movingavg
10.00
15.00
20.00
30.00
```

ウィンドウ幅を `2` に指定して実行する場合：

```bash
$ printf "10\n20\n30\n40\n" | ./movingavg 2
10.00
15.00
25.00
35.00
```

## テスト

```bash
$ ./test.bash
```

## 動作環境

* Ubuntu 24.04 (GitHub Actions: ubuntu-latest)
* Python 3

## ライセンス

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2026 Kaito Komatsuzaki
