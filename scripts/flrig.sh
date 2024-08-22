echo 'Building Flrig 2.0.05'
sleep 1
sudo apt-get install libfltk1.3-dev libjpeg62-turbo-dev libxft-dev libxinerama-dev libxcursor-dev libsndfile1-dev libsamplerate0-dev portaudio19-dev libusb-1.0-0-dev libpulse-dev libudev-dev texinfo -y
cd ~/build
wget http://www.w1hkj.com/files/flrig/flrig-2.0.05.tar.gz
tar -zxvf flrig-2.0.05.tar.gz
cd flrig-2.0.05
./configure --prefix=/usr/local --enable-static
make
sudo checkinstall -D make install
