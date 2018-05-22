#!/usr/bin/env bash

set -x

git clone https://github.com/rbenv/rbenv.git /home/mastodon/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
