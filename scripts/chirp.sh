echo 'Install Chirp'
sudo apt install git python3-wxgtk4.0 python3-serial python3-six python3-future python3-requests python3-pip -y
wget https://archive.chirpmyradio.com/chirp_next/next-20240312/chirp-20240312-py3-none-any.whl
pip install ./chirp-20240312-py3-none-any.whl
