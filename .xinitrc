# Start the notification daemon
/usr/lib/notification-daemon-1.0/notification-daemon &

# Set the reolution
~/Desktop/resautostart.sh

# Set the root window's name
xsetroot -name "Arch Dev"

# Set a background
nitrogen --restore &

# Start dwm
exec dwm
