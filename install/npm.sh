#!/usr/bin/env bash

source ./utils.sh

e_header "Installing npm modules"

packages=(
  bower
  clean-css
  coffee-script
  create-react-app
  csslint
  diff-so-fancy
  eslint
  ffmpeg-gif
  git-land
  grunt-cli
  gulp-cli
  hicat
  html-minifier
  init-module
  js-beautify
  js2coffee
  jscs
  jspm
  less
  nodemon
  np
  npm-check
  npm-release
  parrotsay
  readability-checker
  release-it
  resume-cli
  speed-test
  spoof
  standard
  surge
  svgo
  tv-schedule
  uglifycss
  uglify-js
  vtop
  yo
)

npm install -g ${packages[@]}
npm config set save true
npm set init-module $(init-module --path)

e_success "Done!"
