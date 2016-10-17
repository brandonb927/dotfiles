#!/usr/bin/env bash

source ./utils.sh

e_header "Setting some git config defaults"

git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global core.pager "diff-highlight | diff-so-fancy | less --tabs=1,5 -R"

# Create a nice last-change git log message, from https://twitter.com/elijahmanor/status/697055097356943360
git config --global alias.lastchange 'log -p --follow -n 1'

e_success "Done!"