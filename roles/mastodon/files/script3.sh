#!/usr/bin/env bash

set -x

echo "User ${USER}"
echo "Home ${HOME}"

type rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.5.0
rbenv global 2.5.0
cd ~
git clone https://github.com/tootsuite/mastodon.git live
cd ~/live
git checkout $(git tag -l | grep -v 'rc[0-9]*$' | sort -V | tail -n 1)
gem install bundler
bundle install -j$(getconf _NPROCESSORS_ONLN) --deployment --without development test
yarn install --pure-lockfile
cd ~/live
RAILS_ENV=production bundle exec rake mastodon:setup << EOF
mt.bounaim.net
n
y
n
y
y
y
y
oussama.bounaim@wescale.fr
EOF
