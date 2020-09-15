#!/bin/bash

set -e

# Installs Jekyll and its dependencies, plus Yarn package manager used
# to build the assets (see below)
if [ ! -d ".bundle" ]; then
	gem update
	gem install bundler
	bundle config set path '.bundle'
	bundle install
	yarn --no-bin-links
fi

# Updates the .css and .js assets
if [ ! -f "assets/css/style.min.css" ] || [ "$1" == "-a" ] || [ "$1" == "--assets" ]; then
	yarn dist
fi

bundle exec jekyll serve --watch
