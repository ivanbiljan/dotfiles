# Start the notification daemon
/usr/lib/notification-daemon-1.0/notification-daemon &

# Set the resolution
~/scripts/setresolution

# Add fonts for xfontsel
xset +fp ~/.local/share/fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Set the root window's name
xsetroot -name "Arch Dev"

# Set a background
nitrogen --restore &

# Fix XToolkit Java Apps 
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wname LG3D

# Start dwm
exec dwm
