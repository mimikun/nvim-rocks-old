---@type table
local opts = {
    -- Rendering configuration
    arguments = {
        -- Icon to use
        icon = "󰂖 ",
    },
    group_names = {
        -- Icon for the hl group name
        icon = "󰏘 ",
    },
    headings = {
        heading_1 = {
            -- Marker to show above the heading
            marker = "═",
            -- Icon to show on the heading
            sign = " ",
        },
    },
    inline_codes = {
        -- Icon to use
        icon = "",
    },
    keycodes = {
        -- Icon to use
        icon = "󰌌 ",
    },
    mention_links = {
        -- Icon to use
        icon = " ",
    },
    modelines = {
        -- Icon to use for the selector
        icon = " ",
        -- Text to use as the selector
        selector = ".vim",
    },
    notes = {
        default = {
            icon = " ",
        },
        warning = {
            icon = " ",
        },
    },
    option_links = {
        icon = " ",
    },
    tag_links = {
        icon = "",
    },
}

return opts
