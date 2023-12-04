yum install -y tcl-devel ruby ruby-devel lua lua-devel luajit luajit-devel python python-devel python3 python3-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embe perl-ExtUtils-Embed ncurses-devel
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-luainterp
make -j8
make install
