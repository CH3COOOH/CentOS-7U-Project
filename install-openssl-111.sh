cd ./bin
wget https://github.com/CH3COOOH/CentOS-7U-Project/releases/download/main/openssl-1.1.1-bin.tgz
cp ./openssl-1.1.1-bin.tgz /opt

cd /opt
tar -zxvf ./openssl-1.1.1-bin.tgz
echo "/opt/openssl/lib" | sudo tee /etc/ld.so.conf.d/openssl.conf
ldconfig
ldconfig -p | grep libssl
/opt/openssl-3.3.1/bin/openssl version
rm -f ./openssl-1.1.1-bin.tgz
