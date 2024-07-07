require("pomo").setup({
    notifiers = {
        {
            name = "Default",
            opts = {
                sticky = true,
                -- TODO: Use utils/icons.lua
                title_icon = "󱎫",
                -- TODO: Use utils/icons.lua
                text_icon = "󰄉",
            },
        },
        { name = "System" },
    },
})
