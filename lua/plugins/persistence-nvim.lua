require("persistence").setup({
    dir = table.concat({ vim.fn.stdpath("state"), "sessions" }, require("core.global").path_sep),
})
