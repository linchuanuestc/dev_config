#install tmux3.1.b 这个版本可以控制颜色, https://github.com/tmux/tmux/wiki/Installing, 不推荐使用源码安装
#重试三次
n=0
until [ "$n" -ge 2 ]
do
   sudo yum install --randomwait=1 -v http://galaxy4.net/repo/galaxy4-release-7-current.noarch.rpm && break  # substitute your command here
   n=$((n+1))
   sleep 3 
done

sudo yum remove tmux

n=0
until [ "$n" -ge 2 ]
do
    sudo yum install --randomwait=1 -v tmux && break  # substitute your command here
   n=$((n+1))
   sleep 3 
done

