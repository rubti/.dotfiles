# If running from tty1 start sway
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'
[ "$(tty)" = "/dev/tty3" ] && exec sway --unsupported-gpu

