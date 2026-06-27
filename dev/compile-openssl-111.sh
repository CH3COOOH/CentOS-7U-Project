./config --prefix=/opt/openssl --openssldir=/opt/openssl shared zlib

make -j$(nproc)
make install_sw

echo "/opt/openssl/lib" | sudo tee /etc/ld.so.conf.d/openssl.conf

ldconfig
ldconfig -p | grep libssl
/opt/openssl/bin/openssl version