export PATH=:/usr/local/sbin:/Library/Python/2.7/site-packages:/usr/local/share/npm/bin:/Users/brandon/Dropbox/Work/scripts:/Applications/android-sdk-macosx/platform-tools:$PATH
export EDITOR='subl -w'

# Sublime text open current directory
alias e='subl . &'

# password generator
alias genpasswd='openssl rand -base64 12'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## Resume wget
alias wget='wget -c'

alias df='df -H'
alias du='du -ch'

alias hosts='sudo subl /etc/hosts'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size of a file(s)
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"


# Git aliases
# ============

# Get latest Git tag in project
alias glt="git describe --abbrev=0 --tags"

# Delete the branch
alias gbd="git branch -d"

# Add SSH keys to ssh-agent whenever a new terminal starts
{ ssh-add ~/.ssh/github } &>/dev/null
{ ssh-add ~/.ssh/heroku } &>/dev/null
