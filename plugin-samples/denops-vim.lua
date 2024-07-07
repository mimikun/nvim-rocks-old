-- Use denops-shared-server if there are no human rights
vim.g.denops_server_addr = not is_human_rights and "127.0.0.1:32123" or ""

require("denops-lazy").setup({
    wait_load = true,
    wait_server = true,
    wait_server_delay = 10,
    wait_server_retry_limit = 100,
})
