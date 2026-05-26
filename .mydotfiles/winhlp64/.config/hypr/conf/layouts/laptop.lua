-- -----------------------------------------------------
-- Layouts
-- name: "Laptop"
-- -----------------------------------------------------

hl.config({
    dwindle = {
        pseudotile     = true,
        preserve_split = true,
    },
    master = {
        -- new_status = "master" -- commented out due to compatibility reasons
    },
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles   = true,
        pass_mouse_when_bound    = false,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
