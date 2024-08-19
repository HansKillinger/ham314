echo 'Building Hamlib 4.5.5'
cd ~/build
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
