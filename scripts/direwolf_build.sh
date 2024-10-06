echo 'Building Direwolf'
cd ~/build
sudo apt-get install git gcc g++ make cmake libasound2-dev libudev-dev -y
git clone https://www.github.com/wb2osz/direwolf
cd direwolf
mkdir build && cd build
cmake ..
make -j4
sudo make install
make install-conf

#sudo cpack -G DEB
#sudo apt install ./direwolf-*.deb
#sudo apt-mark hold direwolf
