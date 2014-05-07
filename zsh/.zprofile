export PATH=/usr/local/share/npm/bin:/Users/brandon/bin:/Users/brandon/Dropbox/Work/scripts:$PATH
export EDITOR='/usr/local/bin/subl'

# Sublime text open current directory
alias e='subl . &'

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

# get latest tags in git
alias glt='git describe --abbrev=0 --tags'

# Set npm package torrent-mount to not make zsh parse magnet lings as URLs
alias torrent-mount='noglob torrent-mount'

# Add github SSH key to ssh-agent whenever a new terminal starts
{ ssh-add ~/.ssh/github } &>/dev/null
