# tree-sitter-powershell in rocks.nvim

```lua
M.powershell = {
    install_info = {
        url = "https://github.com/mimikun/tree-sitter-PowerShell",
        files = { "src/parser.c" },
        branch = "test",
    },
    filetype = { "ps1", "psd1" },
}

