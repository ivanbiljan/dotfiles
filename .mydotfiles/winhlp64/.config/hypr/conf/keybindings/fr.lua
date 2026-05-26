-- -----------------------------------------------------
-- Key bindings
-- name: "FR"
-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- -----------------------------------------------------

local mainMod      = "SUPER"
local HYPRSCRIPTS  = "~/.config/hypr/scripts"
local SCRIPTS      = "~/.config/ml4w/scripts"

-- Applications
hl.bind(mainMod .. " + RETURN",   hl.dsp.exec_cmd("~/.config/ml4w/settings/terminal.sh"))    -- Open the terminal
hl.bind(mainMod .. " + B",        hl.dsp.exec_cmd("~/.config/ml4w/settings/browser.sh"))      -- Open the browser
hl.bind(mainMod .. " + E",        hl.dsp.exec_cmd("~/.config/ml4w/settings/filemanager.sh"))  -- Open the filemanager
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("~/.config/ml4w/settings/emojipicker.sh"))  -- Open the emoji picker
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"))   -- Open the calculator

-- Display
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}")]])) -- Increase display zoom
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}")]])) -- Decrease display zoom
hl.bind(mainMod .. " + SHIFT + Z",          hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1")) -- Reset display zoom

-- Windows
hl.bind(mainMod .. " + Q",            hl.dsp.window.close())                                  -- Kill active window
hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exec_cmd([[hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill]])) -- Quit active window and all open instances
hl.bind(mainMod .. " + F",            hl.dsp.window.fullscreen({ mode = "fullscreen" }))      -- Set active window to fullscreen
hl.bind(mainMod .. " + M",            hl.dsp.window.fullscreen({ mode = "maximized" }))       -- Maximize Window
hl.bind(mainMod .. " + T",            hl.dsp.window.float({ action = "toggle" }))             -- Toggle active windows into floating mode
hl.bind(mainMod .. " + SHIFT + T",    hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat")) -- Toggle all windows into floating mode
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))                           -- Toggle split
hl.bind(mainMod .. " + left",         hl.dsp.focus({ direction = "l" }))                      -- Move focus left
hl.bind(mainMod .. " + right",        hl.dsp.focus({ direction = "r" }))                      -- Move focus right
hl.bind(mainMod .. " + up",           hl.dsp.focus({ direction = "u" }))                      -- Move focus up
hl.bind(mainMod .. " + down",         hl.dsp.focus({ direction = "d" }))                      -- Move focus down
hl.bind(mainMod .. " + mouse:272",    hl.dsp.window.drag(),   { mouse = true })               -- Move window with the mouse
hl.bind(mainMod .. " + mouse:273",    hl.dsp.window.resize(), { mouse = true })               -- Resize window with the mouse
hl.bind(mainMod .. " + SHIFT + right",hl.dsp.window.resize({ x = 100,  y = 0,   relative = true })) -- Increase window width
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0,   relative = true })) -- Reduce window width
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0,    y = 100, relative = true })) -- Increase window height
hl.bind(mainMod .. " + SHIFT + up",   hl.dsp.window.resize({ x = 0,    y = -100,relative = true })) -- Reduce window height
hl.bind(mainMod .. " + G",            hl.dsp.group.toggle())                                  -- Toggle window group
hl.bind(mainMod .. " + K",            hl.dsp.layout("swapsplit"))                             -- Swapsplit
hl.bind(mainMod .. " + ALT + left",   hl.dsp.window.swap({ direction = "l" }))                -- Swap tiled window left
hl.bind(mainMod .. " + ALT + right",  hl.dsp.window.swap({ direction = "r" }))                -- Swap tiled window right
hl.bind(mainMod .. " + ALT + up",     hl.dsp.window.swap({ direction = "u" }))                -- Swap tiled window up
hl.bind(mainMod .. " + ALT + down",   hl.dsp.window.swap({ direction = "d" }))                -- Swap tiled window down
hl.bind("ALT + Tab", function()                                                               -- Cycle between windows
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end, { repeating = true })

-- Actions
hl.bind(mainMod .. " + CTRL + R",     hl.dsp.exec_cmd("hyprctl reload"))                       -- Reload Hyprland configuration
hl.bind(mainMod .. " + SHIFT + A",    hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggle-animations.sh"))  -- Toggle animations
hl.bind(mainMod .. " + PRINT",        hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh"))         -- Take a screenshot
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh"))         -- Take a screenshot
hl.bind(mainMod .. " + CTRL + Q",     hl.dsp.exec_cmd("~/.config/ml4w/scripts/wlogout.sh"))     -- Start wlogout
hl.bind(mainMod .. " + SHIFT + W",    hl.dsp.exec_cmd("waypaper --random"))                     -- Change the wallpaper
hl.bind(mainMod .. " + CTRL + W",     hl.dsp.exec_cmd("waypaper"))                              -- Open wallpaper selector
hl.bind(mainMod .. " + ALT + W",      hl.dsp.exec_cmd(HYPRSCRIPTS .. "/wallpaper-automation.sh")) -- Start random wallpaper script
hl.bind(mainMod .. " + CTRL + RETURN",hl.dsp.exec_cmd("~/.config/hypr/scripts/launcher.sh"))    -- Open application launcher
hl.bind(mainMod .. " + CTRL + K",     hl.dsp.exec_cmd(HYPRSCRIPTS .. "/keybindings.sh"))        -- Show keybindings
hl.bind(mainMod .. " + SHIFT + B",    hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))            -- Reload waybar
hl.bind(mainMod .. " + CTRL + B",     hl.dsp.exec_cmd("~/.config/waybar/toggle.sh"))            -- Toggle waybar
hl.bind(mainMod .. " + SHIFT + R",    hl.dsp.exec_cmd(HYPRSCRIPTS .. "/loadconfig.sh"))         -- Reload hyprland config
hl.bind(mainMod .. " + V",            hl.dsp.exec_cmd(SCRIPTS .. "/cliphist.sh"))               -- Open clipboard manager
hl.bind(mainMod .. " + CTRL + T",     hl.dsp.exec_cmd("~/.config/waybar/themeswitcher.sh"))     -- Open waybar theme switcher
hl.bind(mainMod .. " + CTRL + S",     hl.dsp.exec_cmd("flatpak run com.ml4w.settings"))         -- Open ML4W Dotfiles Settings app
hl.bind(mainMod .. " + ALT + G",      hl.dsp.exec_cmd(HYPRSCRIPTS .. "/gamemode.sh"))           -- Toggle game mode
hl.bind(mainMod .. " + CTRL + L",     hl.dsp.exec_cmd("~/.config/hypr/scripts/power.sh lock"))  -- Lock screen
hl.bind(mainMod .. " + SHIFT + H",    hl.dsp.exec_cmd(HYPRSCRIPTS .. "/hyprshade.sh"))          -- Launch Hyprshade
hl.bind("CTRL + Tab",                 hl.dsp.exec_cmd("~/.config/ml4w/scripts/focus.sh"))       -- Open Select Window Menu

-- Sidepad
hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh"))         -- Open Sidepad
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --hide"))  -- Close Sidepad
hl.bind(mainMod .. " + S",            hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --init"))  -- Init Sidepad
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --select")) -- Select Sidepad

-- Workspaces (French keysyms map to 1-10)
local wsKeys = { "ampersand", "eacute", "quotedbl", "apostrophe", "parenleft",
                 "minus", "egrave", "underscore", "ccedilla", "agrave" }
for i = 1, 10 do
    local key = wsKeys[i]
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))                       -- Open workspace i
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))  -- Move active window to workspace i
    hl.bind(mainMod .. " + CTRL + " .. key,  hl.dsp.exec_cmd(HYPRSCRIPTS .. "/moveTo.sh " .. i))    -- Move all windows to workspace i
end

hl.bind(mainMod .. " + Tab",          hl.dsp.focus({ workspace = "m+1" }))  -- Open next workspace
hl.bind(mainMod .. " + SHIFT + Tab",  hl.dsp.focus({ workspace = "m-1" }))  -- Open previous workspace

hl.bind(mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "e+1" }))   -- Open next workspace
hl.bind(mainMod .. " + mouse_up",     hl.dsp.focus({ workspace = "e-1" }))   -- Open previous workspace
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.focus({ workspace = "empty" })) -- Open the next empty workspace

-- Fn keys
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -q s +10%"))                      -- Increase brightness by 10%
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 10%-"))                      -- Reduce brightness by 10%
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))     -- Increase volume by 5%
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))     -- Reduce volume by 5%
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))   -- Toggle mute
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"))                         -- Audio play pause
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl pause"))                              -- Audio pause
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"))                               -- Audio next
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"))                           -- Audio previous
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))-- Toggle microphone
hl.bind("XF86Calculator",        hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"))        -- Open calculator
hl.bind("XF86Lock",              hl.dsp.exec_cmd("hyprlock"))                                     -- Open screenlock
hl.bind("XF86Tools",             hl.dsp.exec_cmd("alacritty --class dotfiles-floating -e ~/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage")) -- Open ML4W Dotfiles Settings app

hl.bind("code:238", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s +10"))
hl.bind("code:237", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s 10-"))
