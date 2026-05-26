-- -----------------------------------------------------
-- General window layout and colors
-- name: "Default"
-- -----------------------------------------------------

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = colors.color11,
            inactive_border = colors.color8,
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
})
