local config = {
    hyper = {
        header = nil,
        week_header = {
            enable = false,
            concat = nil,
            append = nil,
        },
        disable_move = false,
    },
    doom = {
        header = nil,
        week_header = {
            enable = false,
            concat = nil,
            append = nil,
        },
        disable_move = false,
    },
}

require("dashboard").setup({
    theme = "hyper",
    disable_move = false,
    shortcut_type = "number",
    change_to_vcs_root = false,
    config = config.hyper,
    hide = {
        statusline = true,
        tabline = true,
    },
    preview = {
        command = "",
        file_path = nil,
        file_height = 0,
        file_width = 0,
    },
}
)
