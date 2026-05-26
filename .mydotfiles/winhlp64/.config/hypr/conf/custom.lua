-- Add your additional Hyprland configurations here
--
-- This is an additional key binding
-- hl.bind("SUPER + CTRL + up", hl.dsp.focus({ workspace = "empty" }))
--
-- Example for xwayland
-- hl.config({ xwayland = { force_zero_scaling = true } })

-- qt5ct environment variable
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- SDL version
hl.env("SDL_VIDEODRIVER", "wayland")
-- hl.env("SDL_VIDEODRIVER", "x11")

-- No Hardware Cursor
-- hl.config({ cursor = { no_hardware_cursors = false } })

-- Blur for waybar
-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

-- Uncomment in case you have issues with screensharing
-- hl.on("hyprland.start", function() hl.exec_cmd("~/.config/hypr/scripts/xdg.sh") end)
