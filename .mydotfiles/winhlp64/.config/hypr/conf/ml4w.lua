--    __  _____  _____      __  _____          ___
--   /  |/  / / / / / | /| / / / ___/__  ___  / _/
--  / /|_/ / /_/_  _/ |/ |/ / / /__/ _ \/ _ \/ _/
-- /_/  /_/____//_/ |__/|__/  \___/\___/_//_/_/
--

-- Pavucontrol floating
hl.window_rule({
    match  = { class = "(.*org.pulseaudio.pavucontrol.*)" },
    float  = true,
    size   = "700 600",
    center = true,
    pin    = true,
})

-- Waypaper
hl.window_rule({
    match  = { class = "(.*waypaper.*)" },
    float  = true,
    size   = "900 700",
    center = true,
    pin    = true,
})

-- SwayNC
hl.layer_rule({ match = { tag = "swaync-control-center" },     blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { tag = "swaync-notification-window" }, blur = true, ignore_alpha = 0.5 })

-- Newelle
hl.window_rule({
    match  = { class = "(io.github.qwersyk.Newelle)" },
    float  = true,
    size   = "1000 700",
    center = true,
    pin    = true,
})

-- ML4W Calendar floating
hl.window_rule({
    match = { class = "(com.ml4w.calendar)" },
    float = true,
    move  = "100%-w-16 66",
    pin   = true,
    size  = "400 400",
})

-- ML4W Sidebar floating
hl.window_rule({
    match = { class = "(com.ml4w.sidebar)" },
    float = true,
    move  = "100%-w-16 66",
    pin   = true,
    size  = "400 660",
})

-- ML4W Welcome App floating
hl.window_rule({
    match  = { class = "(com.ml4w.welcome)" },
    float  = true,
    size   = "700 600",
    center = true,
    pin    = true,
})

-- ML4W Settings App floating
hl.window_rule({
    match = { class = "(com.ml4w.settings)" },
    float = true,
    size  = "800 600",
    move  = "10% 20%",
})

-- Blueman Manager
hl.window_rule({
    match  = { class = "(blueman-manager)" },
    float  = true,
    size   = "800 600",
    center = true,
})

-- nwg-look
hl.window_rule({
    match = { class = "(nwg-look)" },
    float = true,
    size  = "700 600",
    move  = "10% 20%",
    pin   = true,
})

-- nwg-displays
hl.window_rule({
    match = { class = "(nwg-displays)" },
    float = true,
    size  = "900 600",
    move  = "10% 20%",
    pin   = true,
})

-- System Mission Center
hl.window_rule({
    match  = { class = "(io.missioncenter.MissionCenter)" },
    float  = true,
    pin    = true,
    center = true,
    size   = "900 600",
})

-- System Mission Center Preference Window
hl.window_rule({
    match  = { class = "(missioncenter)", title = "^(Preferences)$" },
    float  = true,
    pin    = true,
    center = true,
})

-- Gnome Calculator
hl.window_rule({
    match  = { class = "(org.gnome.Calculator)" },
    float  = true,
    size   = "700 600",
    center = true,
})

-- Hyprland Share Picker
hl.window_rule({
    match  = { class = "(hyprland-share-picker)" },
    float  = true,
    pin    = true,
    center = true,
    size   = "600 400",
})

-- General floating
hl.window_rule({
    match  = { class = "(dotfiles-floating)" },
    float  = true,
    size   = "1000 700",
    center = true,
})

-- Dotfiles Sidepad
hl.window_rule({
    match  = { class = "(dotfiles-sidepad)" },
    float  = true,
    size   = "1000 700",
    center = true,
    pin    = true,
})

-- Float and center file pickers
hl.window_rule({
    match  = { class = "xdg-desktop-portal-gtk", title = "^(Open.*Files?|Save.*Files?|All Files|Save)" },
    float  = true,
    center = true,
})

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- GDK
hl.env("GDK_SCALE", "1")

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Set the cursor size for xcursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Ozone
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
