step1: build openssl
step2: download python tar
step3: yum update & yum install openssl-devel bzip2-devel libffi-devel & yum groupinstall "Development Tools"
step5: ./configure --enable-optimizations --enable-shared --with-openssl=$SSL_DIR
