## ubuntu 环境配置

* 安装 sogou 拼音输入法
  * 从 sogou 官网下载 deb 安装包
  * sudo apt-get install gdebi
  * sudo gdebi sogou-xxxxx

## 开发环境配置

git neovim python2/3 (dev,pip) zsh tmux nodejs

#### 安装 git

* sudo apt-get install git
* git clone https://github.com/iamcco/dotfiles

#### 安装 nodejs

* sudo apt-get install nodejs-legacy
* sudo apt-get install npm

#### 安装 tmux

* sudo apt-get install tmux
> ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf


#### 安装 neovim

* sudo apt-get install software-properties-common
* sudo add-apt-repository ppa:neovim-ppa/unstable
* sudo apt-get update
* sudo apt-get install neovim xclip
* sudo apt-get install python-dev python-pip python3-dev python3-pip
* ln -s dotfiles/vim .config/nvim
> :PlugInstall    
> :UpdateRemotePlugins

**neovim**
```
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

#### 安装字体 font-manager

```
mkdir ~/.fonts
mv fontName ~/.fonts
cd ~/.fonts/fontName
mkfontdir
mkfontscale
fc-cache -fv
```

### 安装 oh-my-zsh

```
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
chsh -s /bin/zsh
```
