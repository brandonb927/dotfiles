#!/usr/bin/env bash

source ./utils.sh

echo ""
echo "Install node and nvm?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing node versions"

  asdf plugin add nodejs
  asdf install nodejs latest:18
  asdf install nodejs latest:16
  asdf global nodejs latest:18
fi

echo ""
echo "Install npm?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing npm modules"

  packages=(
    nodemon
    resume-cli
    speed-test
    surge
    trash-cli
  )

  npm install -g ${packages[@]}
fi


echo ""
echo "Install ruby and versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing various versions of ruby"

  asdf plugin add ruby
  asdf install ruby latest:3
  asdf global ruby latest:3
fi

echo ""
echo "Install python and versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing python and versions"

  # For compilers to find zlib you may need to set:
  # export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
  # export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

  # For pkg-config to find zlib you may need to set:
  # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

  # Because of old python version
  #CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
  asdf plugin add python
  asdf install python latest:2
  asdf install python latest:3
  asdf global python latest:3
fi

echo ""
echo "Install Go and latest version?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing go and versions"

  asdf plugin add go
  asdf install go latest:1
fi

e_success "Done!"
