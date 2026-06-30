./config \
  --prefix=/opt/openssl-3.3.1 \
  --openssldir=/opt/openssl-3.3.1 \
  enable-ktls \
  enable-zlib \
  shared \
  enable-ec_nistp_64_gcc_128

make -j$(nproc)
make install_sw

ln -sf /opt/openssl-3.3.1/lib64/libcrypto.so.3 /usr/lib64/
ln -sf /opt/openssl-3.3.1/lib64/libssl.so.3 /usr/lib64/
# 如果想取代系统OpenSSL（不推荐），执行：
# ln -sf /opt/openssl-3.3.1/bin/openssl /usr/bin/openssl

echo "/opt/openssl-3.3.1/lib64" >> /etc/ld.so.conf
ldconfig


/opt/openssl-3.3.1/bin/openssl version



