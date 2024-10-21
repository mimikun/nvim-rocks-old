---@type boolean
local detail = false

---@type LazySpec
local spec = {
    "stevearc/oil.nvim",
    lazy = false,
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        local oil = require("oil")
        local new_git_status = require("plugins.configs.oil-nvim.util").new_git_status

        local git_status = new_git_status()

        -- Clear git status cache on refresh
        local refresh = require("oil.actions").refresh
        local orig_refresh = refresh.callback
        refresh.callback = function(...)
            git_status = new_git_status()
            orig_refresh(...)
        end

        oil.setup({
            default_file_explorer = true,
            win_options = {
                -- Use oil-git-status.nvim
                signcolumn = "yes:2",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            keymaps = {
                ["gd"] = {
                    callback = function()
                        detail = not detail
                        if detail then
                            oil.set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            oil.set_columns({ "icon" })
                        end
                    end,
                    desc = "Toggle file detail view",
                },
            },
            view_options = {
                -- Respects gitignore settings
                is_hidden_file = function(name, bufnr)
                    local dir = oil.get_current_dir(bufnr)
                    local is_dotfile = vim.startswith(name, ".") and name ~= ".."
                    -- if no local directory (e.g. for ssh connections), just hide dotfiles
                    if not dir then
                        return is_dotfile
                    end
                    -- dotfiles are considered hidden unless tracked
                    if is_dotfile then
                        return not git_status[dir].tracked[name]
                    else
                        -- Check if file is gitignored
                        return git_status[dir].ignored[name]
                    end
                end,
            },
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
