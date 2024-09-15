echo 'Build PCSI'
cd ~
git clone https://github.com/maqifrnswa/PCSI.git
python -m venv PCSI/
sudo apt install python3-opencv python3-tk python3-pil.imagetk -y
PCSI/bin/pip install numpy imageio pylbfgs pyserial pillow
PCSI/bin/pip install bitstring==4.1.4
