-- Can be `npm`, `yarn`, or `pnpm`
---@type string
local use_pm = "pnpm"

require("package-info").setup({
    icons = {
        enable = true,
        style = {
            -- TODO: Use utils/icons.lua
            up_to_date = "|  ",
            -- TODO: Use utils/icons.lua
            outdated = "|  ",
        },
    },
    package_manager = use_pm,
})
