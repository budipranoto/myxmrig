# server update & requesting apps install
yum install -y epel-release
yum install -y git make cmake gcc gcc-c++ libstdc++-static libmicrohttpd-devel libuv-static

# activate hugepages
echo 10000 > /proc/sys/vm/nr_hugepages

# creating swap files
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

# cloning xmrig package
git clone https://github.com/xmrig/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib64/libuv.a

# making program
make

#launch xmrig
./xmrig --donate-level 1 --av 2 -o xmr.pool.minergate.com:45700 -u budipranoto@live.com -p x -k
