cp ./opt/openssl-1.1.1.tgz /opt

cd /opt
tar zxvf ./openssl-1.1.1.tgz
echo "/opt/openssl/lib" | sudo tee /etc/ld.so.conf.d/openssl.conf
ldconfig
ldconfig -p | grep libssl
/opt/openssl-3.3.1/bin/openssl version
rm -f ./openssl-1.1.1.tgzopenssl-1.1.1.tgz
