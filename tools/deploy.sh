tar -zxvf bundle.tar.gz
tar -zxvf vim9.tar.gz
mkdir -p ../.local
mv root/.local/* ../.local
cp bin/* ../.local/bin
echo "export PATH=\"~/.local/bin:\$PATH\"" >> ~/.bashrc
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum install -y ripgrep ruby
mv vimrc.mini vimrc
