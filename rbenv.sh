#!/bin/bash

#Centos 7 - rbenv, ruby and rails setup

#rbenv install
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source .bashrc

#ruby install
rbenv install 2.2.2
rbenv global 2.2.2

#required gems
gem install bundler
gem install sqlite3 --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri

rbenv rehash

#git prompt
curl https://raw.githubusercontent.com/git/git/8976500cbbb13270398d3b3e07a17b8cc7bff43f/contrib/completion/git-prompt.sh > .git_prompt.sh
chmod 700 .git_prompt.sh

cat ~/setup/bashrc_extra >> ~/.bashrc
