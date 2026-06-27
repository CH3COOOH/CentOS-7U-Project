export LD_LIBRARY_PATH=/opt/openssl/lib:$LD_LIBRARY_PATH
export CPPFLAGS="-I/opt/openssl/include"
export LDFLAGS="-L/opt/openssl/lib"

make distclean

./configure \
  --prefix=/opt/python312 \
  --with-openssl=/opt/openssl \
  --with-openssl-rpath=auto \
  --enable-optimizations

make -j$(nproc)
make install

ln -s /opt/python312/bin/python3.12 /usr/bin/python312
ln -s /opt/python312/bin/pip3.12 /usr/bin/pip312
