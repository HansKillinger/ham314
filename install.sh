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
echo 'Install js8call 2.2.0'
wget http://files.js8call.com/2.2.0/js8call_2.2.0_armhf.deb
sudo dpkg -i js8call_2.2.0_armhf.deb
echo 'Install Chirp'
sudo apt install git python3-wxgtk4.0 python3-serial python3-six python3-future python3-requests python3-pip -y
wget https://archive.chirpmyradio.com/chirp_next/next-20240312/chirp-20240312-py3-none-any.whl
pip install ./chirp-20240312-py3-none-any.whl
echo 'Install Grid Tracker'
curl  https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
sudo apt-get update
sudo apt-get install gridtracker
