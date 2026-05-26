-- -----------------------------------------------------
-- Window rules
-- -----------------------------------------------------

hl.window_rule({ match = { title = "^(Microsoft-edge)$" }, tile = true })
hl.window_rule({ match = { title = "^(Brave-browser)$" },  tile = true })
hl.window_rule({ match = { title = "^(Chromium)$" },       tile = true })
hl.window_rule({ match = { title = "^(pavucontrol)$" },           float = true })
hl.window_rule({ match = { title = "^(blueman-manager)$" },       float = true })
hl.window_rule({ match = { title = "^(nm-connection-editor)$" },  float = true })
hl.window_rule({ match = { title = "^(qalculate-gtk)$" },         float = true })

-- Browser Picture in Picture
hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin   = true,
    move  = "69.5% 4%",
})

-- idleinhibit (Available modes: none, always, focus, fullscreen)
hl.window_rule({ match = { class = "([window])" }, idle_inhibit = "fullscreen" })

-- xwayland related rules
-- when moving objects in resolve a large border is produced
-- This rule prevents that and serves as a template for any problematic xwayland apps
hl.window_rule({ match = { class = "^(\\bresolve\\b)$", xwayland = true }, no_blur = true })
-- This is a general rule for xwayland apps but can have other consequences
-- for one user it impacted EMACs so it's disabled by default
-- hl.window_rule({ match = { xwayland = true }, no_blur = true })

-- JetBrains rules
-- fix tooltips (always have a title of `win.<id>`)
hl.window_rule({
    match            = { class = "^(.*jetbrains.*)$", title = "^(win.*)$" },
    no_initial_focus = true,
    no_focus         = true,
})
-- fix tab dragging (always have a single space character as their title)
hl.window_rule({
    match            = { class = "^(.*jetbrains.*)$", title = "^\\s$" },
    no_initial_focus = true,
    no_focus         = true,
})
