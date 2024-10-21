-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "latte",
        "frappe",
        "macchiato",
        "mocha",
    },
}

function M.set_theme(theme)
    ---@type CatppuccinOptions
    local opts = {
        transparent_background = vim.g.transparent_enabled,
    }

    require("catppuccin").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
