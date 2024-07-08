require("nvim-tree-preview").setup({
    keymaps = {
        ["<Esc>"] = { action = "close", unwatch = true },
        ["<Tab>"] = { action = "toggle_focus" },
        ["<CR>"] = { open = "edit" },
        ["<C-t>"] = { open = "tab" },
        ["<C-v>"] = { open = "vertical" },
        ["<C-x>"] = { open = "horizontal" },
    },
    min_width = 10,
    min_height = 5,
    max_width = 85,
    max_height = 25,
    wrap = false,
    border = "rounded",
    zindex = 100,
})
