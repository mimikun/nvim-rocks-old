local iconsets = require("utils.icons")

---@type table
local icons = {
    ui = iconsets.get("ui"),
    diagnostics = iconsets.get("diagnostics"),
    misc = iconsets.get("misc"),
}

---@type table
local opts = {
    keywords = {
        FIX = {
            icon = icons.ui.Bug,
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = icons.ui.Accepted, color = "info" },
        HACK = { icon = icons.ui.Fire, color = "warning" },
        WARN = { icon = icons.diagnostics.Warning, color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = icons.ui.Perf, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = icons.ui.Note, color = "hint", alt = { "INFO" } },
        TEST = { icon = icons.misc.Watch, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
        multiline = false,
    },
}

require("todo-comments").setup(opts)
