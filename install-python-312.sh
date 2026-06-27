cd ./bin
wget https://github.com/CH3COOOH/CentOS-7U-Project/releases/download/main/python312.tgz
cp ./opt/python312.tgz /opt

cd /opt
tar -zxvf ./python312.tgz
ln -s /opt/python312/bin/python3.12 /usr/bin/python312
ln -s /opt/python312/bin/pip3.12 /usr/bin/pip312
python312 --version
python312 -m sslpython312 -m ssl
rm -f ./python312.tgz
