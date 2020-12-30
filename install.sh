#! /bin/bash

WORKSPACE="/home/linchuan/init"
SOURCEDIR="${WORKSPACE}/source"
VIMSOURCEDIR="/tmp/vim"
VIMINSTALLDIR="/usr/local/vim"
BINDIR="/usr/local/bin"
HOME="/home/linchuan"

#创建工作目录
sudo rm -rf ${WORKSPACE} ${VIMSOURCEDIR} ${VIMINSTALLDIR} 2>/dev/null
mkdir ${WORKSPACE}
cd ${WORKSPACE}

# 获取配置源文件
git clone https://github.com/linchuanuestc/CentOS_Conf.git  ${SOURCEDIR}

#安装最新版vim
git clone https://github.com/vim/vim ${VIMSOURCEDIR} 
cd ${VIMSOURCEDIR}
./configure --prefix=${VIMINSTALLDIR}
sudo make
sudo make install
sudo cp -f ${VIMINSTALLDIR}/bin/vim      ${BINDIR}/vim
sudo cp -f ${VIMINSTALLDIR}/bin/vimdiff  ${BINDIR}/vimdiff
rm -rf ${HOME}/.vim 2>/dev/null
tar -C  ${HOME}  -zxf ${SOURCEDIR}/vim.tar.gz
cp -f ${SOURCEDIR}/vimrc ${HOME}/.vimrc

#bash 替换
cp -f ${SOURCEDIR}/bash_profile ${HOME}/.bash_profile
cp -f ${SOURCEDIR}/bashrc ${HOME}/.bashrc

#install tmux2.8;这个版本很稳定
sudo sh -x ${SOURCEDIR}/tmux_install.sh #安装的是tmux2.8,这个版本很稳定
cp -f ${SOURCEDIR}/tmux.conf ${HOME}/.tmux.conf #创建tmux 配置文件
/usr/local/bin/tmux source-file ${HOME}/.tmux.conf 


#cp git-complete
cp -f ${SOURCEDIR}/git-completion.bash ${HOME}/.git-completion.bash 

