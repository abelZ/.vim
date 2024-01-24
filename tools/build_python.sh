step1: build openssl, link lib64 to lib because python build search for lib
step2: download python tar
step3: yum update & yum install openssl-devel bzip2-devel libffi-devel & yum groupinstall "Development Tools"
step5: ./configure --enable-optimizations --enable-shared --with-openssl=$SSL_DIR
