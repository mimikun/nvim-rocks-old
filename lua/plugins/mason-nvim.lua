local iconsets = require("utils.icons")

---@type table
local icons = {
    kind = iconsets.get("kind"),
    ui = iconsets.get("ui"),
    misc = iconsets.get("misc"),
}

require("mason").setup({
    max_concurrent_installers = require("config.global").is_human_rights and 4 or 1,
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        width = 0.88,
        height = 0.8,
        icons = {
            package_installed = icons.ui.Check,
            package_pending = icons.misc.Ghost,
            package_uninstalled = icons.kind.Close,
        },
    },
})
