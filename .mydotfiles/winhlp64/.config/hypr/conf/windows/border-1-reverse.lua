-- -----------------------------------------------------
-- General window layout and colors
-- name: "Border 1 Reverse"
-- -----------------------------------------------------

hl.config({
    general = {
        gaps_in     = 10,
        gaps_out    = 20,
        border_size = 1,
        col = {
            active_border   = colors.color8,
            inactive_border = colors.color11,
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
})
