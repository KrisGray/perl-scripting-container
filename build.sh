#!/bin/bash
apt-get update
apt-get -y install build-essential
apt-get -y install wget
apt-get -y install curl
apt-get -y install perl
apt-get -y install git
apt-get -y install sudo
apt-get -y install mysql-server
apt-get -y install libmysqlclient-dev
apt-get -y install libpq-dev
/etc/init.d/mysql start

curl -L http://cpanmin.us | perl - App::cpanminus;

git clone https://github.com/tokuhirom/plenv.git /root/.plenv
echo 'export PATH="/root/.plenv/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(plenv init -)"' >> /root/.bashrc

git clone https://github.com/tokuhirom/Perl-Build.git /root/.plenv/plugins/perl-build

export PATH="/root/.plenv/bin:$PATH"
eval "$(plenv init -)"

plenv install 5.28.0
plenv rehash
plenv global 5.28.0
plenv install-cpanm
cpanm --installdeps /;
