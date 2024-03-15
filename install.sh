sudo apt-get update
sudo apt-get install libfltk1.3-dev libjpeg9-dev libxft-dev libxinerama-dev libxcursor-dev libsndfile1-dev libsamplerate0-dev portaudio19-dev libusb-1.0-0-dev install libpulse-dev install libudev-dev texinfo -y
sudo apt-get install -y libjpeg62-turbo-dev
echo 'Building Hamlib 4.5.5'
wget https://github.com/Hamlib/Hamlib/releases/download/4.5.5/hamlib-4.5.5.tar.gz
tar -zxvf hamlib-4.5.5.tar.gz
cd hamlib-4.5.5
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
cd ..
echo 'Building Flrig 2.0.05'
wget http://www.w1hkj.com/files/flrig/flrig-2.0.05.tar.gz
tar -zxvf flrig-2.0.05.tar.gz
cd flrig-2.0.05
./configure --prefix=/usr/local --enable-static
make
sudo make install
cd ..
echo 'Building Fldigi 4.2.04'
wget http://www.w1hkj.com/files/fldigi/fldigi-4.2.04.tar.gz
tar -zxvf fldigi-4.2.04.tar.gz
cd fldigi-4.2.04
./configure --prefix=/usr/local --enable-static
make
sudo make install
cd ..
echo 'Adding user bob to dialout'
sudo usermod -a -G dialout bob
echo 'Building Direwolf'
sudo apt-get install git gcc g++ make cmake libasound2-dev libudev-dev -y
git clone https://www.github.com/wb2osz/direwolf
cd direwolf
mkdir build && cd build
cmake ..
make -j4
sudo make install
make install-conf
cd ..
