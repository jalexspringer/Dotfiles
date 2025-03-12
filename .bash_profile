#
# ~/.bash_profile
#
 /usr/bin/rclone mount --vfs-cache-mode full --cache-dir /home/alexs/.cache/rclone --dir-cache-time 1m --daemon  iclouddrive:Shared Shared
[[ -f ~/.bashrc ]] && . ~/.bashrc
