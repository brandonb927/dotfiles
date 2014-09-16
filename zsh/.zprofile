export PATH=:/usr/local/sbin:/Library/Python/2.7/site-packages:/usr/local/share/npm/bin:/Users/brandon/Dropbox/Work/scripts:/Applications/android-sdk-macosx/platform-tools:$PATH
export EDITOR='subl -w'

# Add SSH keys to ssh-agent whenever a new terminal starts
{ ssh-add ~/.ssh/github } &>/dev/null
{ ssh-add ~/.ssh/heroku } &>/dev/null
