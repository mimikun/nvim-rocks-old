require("marks").setup({
    builtin_marks = {
        "'",
        "^",
        ".",
        "<",
        ">",
    },
    default_mappings = true,
    signs = true,
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 150,
    sign_priority = 10,
    excluded_filetypes = {},
    excluded_buftypes = {},
    mappings = {},
})
