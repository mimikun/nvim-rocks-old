require("hop").setup({
    keys = "asdghklqwertyuiopzxcvbnmfj",
    quit_key = "<Esc>",
})

vim.keymap.set("n", "<leader>h", ":HopWord<CR>", { silent = true })
