## vim and tmux confs 
- 通过此脚本可以快速布置一个centos环境+vim环境+tmux
- 按照以下步骤执行即可

## bash 配置文件
- cp bash_profile ../.bash_profile
- cp bashrc ../.bashrc

## centos 环境部署
下载vim8 https://github.com/vim/vim
源码安装
- ./configure --prefix=/usr/local/vim
- make
- make install

安装go 环境

安装vim-go
- https://github.com/fatih/vim-go
- 使用package vim8 安装 ,注意GoInstallBinaries

用vimrc 覆盖 ~/.vimrc
tar -C ../  -zvxf vim.tar.gz

安装tmux  sudo sh tmux_install.sh #安装的是tmux2.8,这个版本很稳定
cp tmux.conf ../.tmux.conf #创建tmux 配置文件

## TODO
把以上步骤写成脚本，一键部署
