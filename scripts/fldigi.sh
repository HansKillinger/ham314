echo 'Building Fldigi 4.2.04'
cd ~/build
wget http://www.w1hkj.com/files/fldigi/fldigi-4.2.05.tar.gz
tar -zxvf fldigi-4.2.05.tar.gz
cd fldigi-4.2.05
./configure --prefix=/usr/local --enable-static
make
sudo make install
