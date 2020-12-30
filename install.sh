#! /bin/bash

WORKSPACE=$(cd `dirname $0` && pwd -P)
VIM_SOURCE_DIR="/tmp/vim"
VIM_INSTALL_DIR="/usr/local/vim"
BIN_DIR="/home/linchuan/.bin"
HOME="/home/linchuan"

#创建工作目录
rm -rf ${VIM_SOURCE_DIR} ${VIM_INSTALL_DIR} 2>/dev/null

#bash 替换
cp -f ${WORKSPACE}/bash_profile ${HOME}/.bash_profile
cp -f ${WORKSPACE}/bashrc ${HOME}/.bashrc

#安装最新版vim, 包含了nerdTree vim-go 以及xcode颜色 和 golang 配置
git clone https://github.com/vim/vim ${VIM_SOURCE_DIR} 
cd ${VIM_SOURCE_DIR}
./configure --prefix=${VIM_INSTALL_DIR}
make
make install
cp -f ${VIM_INSTALL_DIR}/bin/vim      ${BIN_DIR}/vim
cp -f ${VIM_INSTALL_DIR}/bin/vimdiff  ${BIN_DIR}/vimdiff
rm -rf ${HOME}/.vim 
cp -r ${WORKSPACE}/.vim ${HOME}

#安装coc 自动补全
curl -sL install-node.now.sh | sh
#注意执行：:CocInstall coc-go
${BIN_DIR}/vim -c 'CocInstall -sync coc-go coc-json'

#install tmux2.8;这个版本很稳定
sh -x ${WORKSPACE}/tmux_install.sh #安装的是tmux2.8,这个版本很稳定
cp -f ${WORKSPACE}/tmux.conf ${HOME}/.tmux.conf #创建tmux 配置文件
/usr/local/bin/tmux source-file ${HOME}/.tmux.conf 

#cp git-complete
cp -f ${WORKSPACE}/git-completion.bash ${HOME}/.git-completion.bash 

#执行bash
source ${HOME}/.bashrc
