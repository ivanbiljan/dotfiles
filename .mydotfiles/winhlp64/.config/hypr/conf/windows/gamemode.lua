-- -----------------------------------------------------
-- General window layout and colors
-- name: "Gamemode"
-- -----------------------------------------------------

hl.config({
    general = {
        gaps_in     = 0,
        gaps_out    = 0,
        border_size = 1,
        col = {
            active_border   = colors.color11,
            inactive_border = colors.color8,
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
})
