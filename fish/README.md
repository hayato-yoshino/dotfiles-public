## fish インストール
```bash
brew install fish
sudo nvim /etc/shells # 末尾に which fish で表示されるパスを追加
chsh -s $(which fish)
```
## fisher インストール
```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```
