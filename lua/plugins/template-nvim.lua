local global = require("config.global")
local temp_dir = table.concat({global.vim_path, "templates"}, global.path_sep)

require("template").setup({
    temp_dir = temp_dir,
})
