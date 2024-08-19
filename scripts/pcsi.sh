echo 'Build PCSI'
cd ~
sudo apt install python3-opencv python3-tk python3-pil.imagetk -y
sudo pip install numpy imageio pylbfgs pyserial pillow
sudo pip install bitstring==4.1.4
git clone https://github.com/maqifrnswa/PCSI.git
