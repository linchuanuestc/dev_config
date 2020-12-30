# Install tmux 2.8 on Centos

# install deps
yum install gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL

LIBSOURCEDIR="/tmp/libevent"
TMUXSOURCEDIR="/tmp/tmux"
LIBEVENTTAR="libevent-2.1.8-stable.tar.gz"
TMUXTAR="tmux-2.8.tar.gz"
rm -rf ${LIBSOURCEDIR} ${TMUXSOURCEDIR}
mkdir ${LIBSOURCEDIR} 
mkdir ${TMUXSOURCEDIR}

curl -Lk https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz -o ${LIBSOURCEDIR}/${LIBEVENTTAR}
cd ${LIBSOURCEDIR}
tar -xf ${LIBEVENTTAR} 
cd libevent-2.1.8-stable
./configure --prefix=/usr/local
make
make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
curl -Lk https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz -o ${TMUXSOURCEDIR}/${TMUXTAR}
cd ${TMUXSOURCEDIR}
tar -xf ${TMUXTAR} 
cd tmux-2.8
rm -rf /usr/local/tmux 2>/dev/null
mkdir /usr/local/tmux
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local/tmux
make
make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
/usr/local/tmux/bin/tmux -V
cp -f /usr/local/tmux/bin/tmux /usr/local/bin/tmux 
