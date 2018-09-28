#!/usr/bin/env bash

source ./utils.sh

e_header "Installing npm modules"

packages=(
  # clean-css
  # coffee-script
  create-react-app
  # csslint
  # eslint
  # ffmpeg-gif
  # fkill-cli
  # git-land
  # git-unsaved
  # grunt-cli
  # gulp-cli
  hicat
  # html-minifier
  init-module
  # js-beautify
  # jscs
  # jspm
  # less
  # nodemon
  # np
  # npm-check
  # npm-release
  # release-it
  resume-cli
  speed-test
  # spoof
  # standard
  surge
  # svgo
  # uglifycss
  # uglify-js
)

npm install -g ${packages[@]}

e_success "Done!"
