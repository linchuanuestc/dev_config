#! /bin/bash

WORKSPACE=$(cd `dirname $0` && pwd -P)
VIM_SOURCE_DIR="/tmp/vim"
VIM_INSTALL_DIR="/usr/local/vim"
BIN_DIR="/home/linchuan/.bin"
export HOME="/home/linchuan"

#创建工作目录
sudo rm -rf ${VIM_SOURCE_DIR} ${VIM_INSTALL_DIR} 2>/dev/null

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
cp -r ${WORKSPACE}/.vim ${HOME}
