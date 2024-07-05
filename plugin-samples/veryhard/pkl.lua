---@type table
local events = {
    "BufReadPre *.pkl",
    "BufReadPre *.pcf",
    "BufReadPre PklProject",
}

---@type LazySpec
local spec = {
    "apple/pkl-neovim",
    build = function()
        vim.cmd("TSInstall! pkl")
    end,
    --lazy = false,
    event = events,
    --cond = false,
}

return spec
