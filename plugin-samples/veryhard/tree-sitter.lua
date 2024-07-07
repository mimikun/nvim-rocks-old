local sources = require("plugins.sources.parsers")
local global = require("core.global")

---@type string
local parser_install_dir = global.parser_install_dir

---@type boolean
local sync_install = not global.is_human_rights

---@type table
local dependencies = {
    "windwp/nvim-ts-autotag",
    "IndianBoy42/tree-sitter-just",
    "LhKipp/nvim-nu",
    "mimikun/tree-sitter-PowerShell",
    "charmbracelet/tree-sitter-vhs",
    "RRethy/nvim-treesitter-textsubjects",
}

---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    init = function()
        vim.opt.runtimepath:prepend(parser_install_dir)
    end,
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        require("nu").setup({})
        require("nvim-ts-autotag").setup({})

        require("nvim-treesitter.configs").setup({
            parser_install_dir = parser_install_dir,
            highlight = {
                enable = true,
                disable = {},
            },
            ensure_installed = sources.need_parsers,
            sync_install = sync_install,
            textsubjects = {
                enable = true,
                -- (Optional) keymap to select the previous selection
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = {
                        "textsubjects-container-inner",
                        desc = "Select inside containers (classes, functions, etc.)",
                    },
                },
            },
        })

        parser_config.powershell = {
            install_info = {
                url = "https://github.com/mimikun/tree-sitter-PowerShell",
                files = { "src/parser.c" },
                branch = "test",
            },
            filetype = { "ps1", "psd1" },
        }

        parser_config.vhs = {
            install_info = {
                url = "https://github.com/charmbracelet/tree-sitter-vhs",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = { "tape" },
        }
    end,
    --cond = false,
}

return spec
