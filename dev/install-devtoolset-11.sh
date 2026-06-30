yum install -y devtoolset-11
# scl enable devtoolset-11 bash
echo 'source /opt/rh/devtoolset-11/enable' | sudo tee /etc/profile.d/devtoolset.sh
/opt/rh/devtoolset-11/enable
