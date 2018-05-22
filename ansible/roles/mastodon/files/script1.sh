#!/usr/bin/env bash

set -x

curl -sL https://deb.nodesource.com/setup_6.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get -y update
apt-get -y install
apt-get -y install yarn nodejs
adduser --uid 1100 --disabled-password --gecos "Mastodon User" mastodon
sudo -u postgres psql -c "CREATE USER mastodon CREATEDB;"
