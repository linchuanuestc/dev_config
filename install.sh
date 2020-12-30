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

#检查golang是否安装
GOLAGN_VERSION=`go version`

#安装最新版vim, 包含了nerdTree vim-go 以及xcode颜色 和 golang 配置
#git clone https://github.com/vim/vim ${VIM_SOURCE_DIR} 
tar -C /tmp -zvxf ${WORKSPACE}/vim.tar.gz
cd ${VIM_SOURCE_DIR}
./configure --prefix=${VIM_INSTALL_DIR}
sudo make
sudo make install
cp -f ${VIM_INSTALL_DIR}/bin/vim      ${BIN_DIR}/vim
cp -f ${VIM_INSTALL_DIR}/bin/vimdiff  ${BIN_DIR}/vimdiff
sudo cp -f ${VIM_INSTALL_DIR}/bin/vim      /usr/bin/vim
sudo cp -f ${VIM_INSTALL_DIR}/bin/vimdiff  /usr/bin/vimdiff
sudo rm -rf ${HOME}/.vim 
cp -r ${WORKSPACE}/.vim ${HOME}

#安装coc 自动补全
curl --fail -LSs https://install-node.now.sh/latest | sudo sh
#注意执行：:CocInstall coc-go
${BIN_DIR}/vim -c 'GoInstallBinaries'
${BIN_DIR}/vim -c 'CocInstall -sync coc-go coc-json'

#install tmux2.8;这个版本很稳定
sh -x ${WORKSPACE}/tmux_install.sh #安装的是tmux2.8,这个版本很稳定
cp -f ${WORKSPACE}/tmux.conf ${HOME}/.tmux.conf #创建tmux 配置文件
/usr/local/bin/tmux source-file ${HOME}/.tmux.conf  2>/dev/null

#cp git-complete
cp -f ${WORKSPACE}/git-completion.bash ${HOME}/.git-completion.bash 
