#!/usr/bin/env bash

source ./utils.sh

e_header "Installing npm modules"

packages=(
  clean-css
  coffee-script
  create-react-app
  csslint
  eslint
  ffmpeg-gif
  fkill-cli
  git-land
  git-unsaved
  grunt-cli
  gulp-cli
  heroku-cli
  hicat
  html-minifier
  init-module
  js-beautify
  jscs
  jspm
  less
  nodemon
  np
  npm-check
  npm-release
  release-it
  resume-cli
  speed-test
  spoof
  standard
  surge
  svgo
  uglifycss
  uglify-js
  vtop
)

npm install -g ${packages[@]}
npm config set save true
npm set init-module $(init-module --path)

e_success "Done!"
