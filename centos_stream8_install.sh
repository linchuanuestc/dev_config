#! /bin/bash

WORKSPACE=$(cd `dirname $0` && pwd -P)
VIM_SOURCE_DIR="/tmp/vim"
VIM_INSTALL_DIR="/usr/local/vim"
BIN_DIR="/home/linchuan/.bin"
export HOME="/home/linchuan"

#创建工作目录
sudo rm -rf ${VIM_SOURCE_DIR} ${VIM_INSTALL_DIR} 2>/dev/null

#bash 替换
cp -f ${WORKSPACE}/bash_profile ${HOME}/.bash_profile
cp -f ${WORKSPACE}/bashrc ${HOME}/.bashrc

#执行bash
source ${HOME}/.bashrc

#cp git-complete
cp -f ${WORKSPACE}/git-completion.bash ${HOME}/.git-completion.bash 

# install centos 8 develop env
dnf group install -y "Development Tools"
sudo yum install -y ncurses-devel.x86_64
sudo dnf install cmake gcc-c++ make python3-devel

#检查golang是否安装
GOLAGN_VERSION=`go version`

#安装最新版vim, 包含了nerdTree vim-go 以及xcode颜色 和 golang 配置
#git clone https://github.com/vim/vim ${VIM_SOURCE_DIR} 
tar -C /tmp -zvxf ${WORKSPACE}/vim.tar.gz
cd ${VIM_SOURCE_DIR}
./configure --prefix=${VIM_INSTALL_DIR} --enable-python3interp=yes
sudo make
sudo make install
cp -f ${VIM_INSTALL_DIR}/bin/vim      ${BIN_DIR}/vim
cp -f ${VIM_INSTALL_DIR}/bin/vimdiff  ${BIN_DIR}/vimdiff
sudo cp -f ${VIM_INSTALL_DIR}/bin/vim      /usr/bin/vim
sudo cp -f ${VIM_INSTALL_DIR}/bin/vimdiff  /usr/bin/vimdiff
sudo rm -rf ${HOME}/.vim 
cp -r ${WORKSPACE}/.vim_YCM_GO ${HOME}
mv ${HOME}/.vim_YCM_GO ${HOME}/.vim
cd ${HOME}/.vim/pack/plugins/start/YouCompleteMe
python3 install.py --go-completer #安装YCM
cd ${WORKSPACE}

#安装coc 自动补全
#sudo sh ${WORKSPACE}/node_install.sh
sudo curl -sL install-node.now.sh/lts | sudo bash
#注意执行：:CocInstall coc-go
${BIN_DIR}/vim -c 'GoInstallBinaries'
#${BIN_DIR}/vim -c 'CocInstall -sync coc-go coc-json' #gopls耗内存，2G内存的机器就不要安装

##如果当前版本颜色有问题，可卸载当前版本，安装其他稳定版本。yum --showduplicates list tmux; yum remove tmux; yum install tmux-{version} 
sh -x ${WORKSPACE}/tmux_install_centos_stream8.sh 
cp -f ${WORKSPACE}/tmux.conf ${HOME}/.tmux.conf #创建tmux 配置文件
