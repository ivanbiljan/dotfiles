--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--
-- -----------------------------------------------------
-- Lua entry point (mirrors hyprland.conf)
-- See https://wiki.hypr.land/Configuring/Start/
--
-- IMPORTANT: Don't overwrite ML4W configuration.
-- Create your own custom configuration variation instead.
-- https://github.com/mylinuxforwork/dotfiles/wiki/Configuration-Variations
-- -----------------------------------------------------

-- Helpers (defines the global load_config())
require("utils")

-- -----------------------------------------------------
-- Monitor
-- -----------------------------------------------------
require("conf.monitor")

-- -----------------------------------------------------
-- Cursor
-- -----------------------------------------------------
require("conf.cursor")

-- -----------------------------------------------------
-- Environment
-- -----------------------------------------------------
require("conf.environment")

-- -----------------------------------------------------
-- Keyboard
-- -----------------------------------------------------
require("conf.keyboard")

-- -----------------------------------------------------
-- Load color file (defines the global `colors` table)
-- -----------------------------------------------------
require("conf.colors")

-- -----------------------------------------------------
-- Autostart
-- -----------------------------------------------------
require("conf.autostart")

-- -----------------------------------------------------
-- Load configuration files
-- -----------------------------------------------------
require("conf.window")
require("conf.decoration")
require("conf.layout")
require("conf.workspace")
require("conf.misc")
require("conf.keybinding")
require("conf.windowrule")

-- -----------------------------------------------------
-- Animation
-- -----------------------------------------------------
require("conf.animation")

-- -----------------------------------------------------
-- Environment for xdg-desktop-portal-hyprland
-- and auto-start hyprpaper
-- -----------------------------------------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprpaper")
end)

-- -----------------------------------------------------
-- ML4W Configuration
-- -----------------------------------------------------
require("conf.ml4w")

-- -----------------------------------------------------
-- Custom
-- -----------------------------------------------------
require("conf.custom")
