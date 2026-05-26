--    ___       __           __           __
--   / _ |__ __/ /____  ___ / /____ _____/ /_
--  / __ / // / __/ _ \(_-</ __/ _ `/ __/ __/
-- /_/ |_\_,_/\__/\___/___/\__/\_,_/_/  \__/
--
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Run once on startup (was: exec-once)
hl.on("hyprland.start", function()
    -- Start Listeners
    hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")

    -- Start Polkit
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    -- Load Wallpaper
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-restore.sh")

    -- Load Notification Daemon
    hl.exec_cmd("swaync")

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

    -- Using hypridle to start hyprlock
    hl.exec_cmd("hypridle")

    -- Load cliphist history
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Autostart ML4W App
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart.sh")

    -- Start autostart cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
end)

-- Run on every config (re)load (was: exec)
-- Load configuration from ML4W Hyprland Settings App
hl.exec_cmd("~/.config/com.ml4w.hyprlandsettings/hyprctl.sh")
