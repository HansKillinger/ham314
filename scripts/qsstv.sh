echo 'Build QSSTV'
cd ~/build
sudo apt install qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools -y
sudo apt-get install pkg-config g++ libfftw3-dev libpulse-dev -y
sudo apt-get install libasound2-dev  libv4l-dev -y
sudo apt-get install libopenjp2-7 libopenjp2-7-dev -y
git clone https://github.com/ON4QZ/QSSTV.git
mkdir QSSTV/src/build
cd QSSTV/src/build
qmake ..
make -j4
sudo make install
