require("scrollbar").setup({
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
    },
    handlers = {
        gitsigns = true,
        search = true,
    },
})
require("scrollbar.handlers.search").setup()
require("scrollbar.handlers.gitsigns").setup()
