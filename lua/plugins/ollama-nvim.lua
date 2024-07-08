require("ollama").setup({
    model = "mistral",
    url = "http://127.0.0.1:11434",
    serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
    },
    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
        Sample_Prompt = {
            prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
            input_label = "> ",
            model = "mistral",
            action = "display",
        },
    },
})

local key_modes = { "n", "v" }
local key_opts = {}

-- "<leader>oo"
-- ":<c-u>lua require('ollama').prompt()<cr>"
vim.keymap.set(key_modes, "<leader>oo", ollama.prompt(), key_opts)

-- "<leader>oG"
-- ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>"
vim.keymap.set(key_modes, "<leader>oG", ollama.prompt("Generate_Code"), key_opts)
