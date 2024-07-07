require("yazi").setup({
    open_for_directories = false,
    floating_window_scaling_factor = 0.9,
    yazi_floating_window_winblend = 0,
    chosen_file_path = "/tmp/yazi_filechosen",
    events_file_path = "/tmp/yazi.nvim.events.txt",
    --'none', 'rounded', 'single', 'double', 'shadow'
    yazi_floating_window_border = "rounded",
})

vim.keymap.set("n", "<leader>-", function()
    require("yazi").yazi()
end, {})
