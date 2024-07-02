---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    --lazy = false,
    event = events,
    config = function()
        local feline = require("feline")
        feline.setup()
        feline.winbar.setup()
        feline.statuscolumn.setup()
