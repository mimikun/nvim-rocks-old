require("modes").setup({
    colors = {
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#9745be",
    },
    line_opacity = 0.15,
    set_cursor = true,
    set_cursorline = true,
    set_number = true,
    ignore_filetypes = { "NvimTree", "TelescopePrompt" },
})

-- NOTE: WORKAROUND bug
-- https://github.com/mvllow/modes.nvim/issues/50#issuecomment-2105522342
vim.opt.guicursor:append("n-c:block-Cursor")
