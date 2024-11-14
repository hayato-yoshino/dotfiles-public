## プラグインインストール
以下コマンドを実行
```
:PlugInstall
```
## defx 使用前にすること
1. `python3` が使用できることを確認
```
:echo has("python3")
```
2. `pynvim` インストール
```bash
pip3 install --user pynvim
```
3. 以下コマンドを実行
```
:UpdateRemotePlugins
```

## Homebrew で事前にインストールしておくもの

```bash
brew install ripgrep
```

## Coc コマンド
- `:CocInstall xxx` : xxx 拡張機能を追加
- `:CocUninstall xxx` : xxx 拡張機能を削除
- `:CocList extensions` : 拡張機能一覧表示
- `:CocList commands` : コマンド一覧表示
- `:CocConfig` : 設定ファイルを開く
