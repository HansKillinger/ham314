echo "Install AX.25"
cd ~/build
sudo apt -y install build-essential autoconf automake libtool checkinstall git cmake
sudo apt -y install libtool dpkg-dev debhelper devscripts fakeroot lintian dh-make config-package-dev dh-exec
sudo apt -y install zlib1g zlib1g-dev
git clone https://github.com/ve7fet/linuxax25.git
cd linuxax25

echo "Build libax25"
cd libax25
./autogen.sh
NUMCPUS=`lscpu | grep CPU\(s\): | awk '{print $2}'`
echo -e "Compiling on $NUMCPUS CPUs concurrently\n"
debuild -us -uc -j$NUMCPUS
cd ..
sudo dpkg -i libax25_*_*.deb
sudo dpkg -i libax25-dev_*_*.deb
sudo apt-mark hold libax25

echo "Build ax25apps"
sudo apt -y install libncursesw5 libncursesw5-dev
cd ax25apps
./autogen.sh
NUMCPUS=`lscpu | grep CPU\(s\): | awk '{print $2}'`
echo -e "Compiling on $NUMCPUS CPUs concurrently\n"
debuild -us -uc -j$NUMCPUS
cd ..
sudo dpkg -i ax25apps_*_*.deb

echo "Build ax25-tools"
cd ax25tools
./autogen.sh
NUMCPUS=`lscpu | grep CPU\(s\): | awk '{print $2}'`
echo -e "Compiling on $NUMCPUS CPUs concurrently\n"
debuild -us -uc -j$NUMCPUS
cd ..
sudo dpkg -i ax25tools_*_*.deb
