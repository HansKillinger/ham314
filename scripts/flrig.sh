echo 'Building Flrig 2.0.05'
wget http://www.w1hkj.com/files/flrig/flrig-2.0.05.tar.gz
tar -zxvf flrig-2.0.05.tar.gz
cd flrig-2.0.05
./configure --prefix=/usr/local --enable-static
make
sudo make install
cd ~/build
