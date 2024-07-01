---@type table
local key_opts = { noremap = true, silent = true, expr = true }

local pantran = require("pantran")
pantran.setup({
    default_engine = "google",
    engines = {
        google = {
            default_source = "en",
            default_target = "ja",
            fallback = {
                default_source = "auto",
                default_target = "ja",
            },
        },
        -- NOTE: MUST SET `DEEPL_AUTH_KEY` env-var
        --[[
        deepl = {
            default_source = "",
            default_target = "",
        },
        ]]
    },
})

vim.keymap.set("n", "tr", pantran.motion_translate, key_opts)
vim.keymap.set("n", "trr", function()
    return pantran.motion_translate() .. "_"
end, key_opts)
vim.keymap.set("x", "tr", pantran.motion_translate, key_opts)
