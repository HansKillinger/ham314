echo 'Building Hamlib 4.5.5'
sudo apt-get update
sudo apt-get install libfltk1.3-dev libjpeg9-dev libxft-dev libxinerama-dev libxcursor-dev libsndfile1-dev libsamplerate0-dev portaudio19-dev libusb-1.0-0-dev libpulse-dev libudev-dev texinfo -y
sudo apt-get install -y libjpeg62-turbo-dev
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
wget http://www.w1hkj.com/files/fldigi/fldigi-4.2.05.tar.gz
tar -zxvf fldigi-4.2.05.tar.gz
cd fldigi-4.2.05
./configure --prefix=/usr/local --enable-static
make
sudo make install
cd ..

echo 'Adding user bob to dialout'
sudo usermod -a -G dialout $USER

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

echo 'Install XASTIR'
sudo apt-get install build-essential -y
sudo apt-get install git autoconf automake xorg-dev graphicsmagick gv libmotif-dev libcurl4-openssl-dev -y
sudo apt-get install gpsman gpsmanshp libpcre3-dev libproj-dev libdb5.3-dev python-dev libax25-dev libwebp-dev -y
sudo apt-get install shapelib libshp-dev festival festival-dev libgeotiff-dev libwebp-dev libgraphicsmagick1-dev -y
sudo apt-get install xfonts-100dpi xfonts-75dpi -y
xset +fp /usr/share/fonts/X11/100dpi,/usr/share/fonts/X11/75dpi
git clone https://github.com/Xastir/Xastir.git
cd Xastir
./bootstrap.sh
mkdir build
cd build
../configure CPPFLAGS="-I/usr/include/geotiff"
make 
sudo make install
sudo chmod u+s /usr/local/bin/xastir

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

echo 'Build Trusted QSL'
sudo apt install cmake libssl-dev libsqlite3-dev libcurl4-openssl-dev libwxgtk3.0-gtk3-dev -y
wget http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-2.7.2.tar.gz
tar -zxvf tqsl-2.7.2.tar.gz
cd tqsl-2.7.2
cmake .
make
sudo make install
sudo cp /usr/local/lib/aarch64-linux-gnu/libtqsllib.so /usr/lib/libtqsllib.so
cd ..

echo 'Install WSJT-X'
wget https://sourceforge.net/projects/wsjt/files/wsjtx-2.6.1/wsjtx_2.6.1_armhf.deb -y
sudo apt --fix-broken install -y

echo 'Build QSSTV'
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

echo 'Install Complete :)'
