#!/usr/bin/env bash

sudo su

apt-get update

apt-get install -y \
  git git-man liberror-perl \
  libreadline-dev libreadline6-dev libssl-dev libssl-doc libtinfo-dev zlib1g-dev \
  autoconf automake autotools-dev bison build-essential dpkg-dev g++ g++-4.8 \
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl \
  libbison-dev libdpkg-perl libfile-fcntllock-perl libltdl-dev libsqlite3-dev \
  libstdc++-4.8-dev libtool libxml2-dev libxslt1-dev libxslt1.1 m4

if [ ! -d ~/.rbenv ]; then
  # install rbenv manually from github, since
  # apt-get install rbenv uses old versions
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  # .bashrc will get skipped in non interactive terminal
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile
  # .profile not executed by vagrant upon ssh'ing in by default
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  source ~/.profile
  source ~/.bashrc
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.profile
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  source ~/.profile
  source ~/.bashrc
fi

cd /sinatra-vagrant-docker-test
# comment these 2 lines out if you want to run `vagrant reload --provision`
rbenv install $(cat ./.ruby-version)
rbenv global $(cat ./.ruby-version)

gem update --system
gem install bundler
rbenv rehash

bundle install
# sinatra will block vagrant port-forwarding unless explicitly binded to 0.0.0.0 below
# daemonize sinatra app so provisioning exits
nohup ruby myapp.rb -o 0.0.0.0 0<&- &>/dev/null &