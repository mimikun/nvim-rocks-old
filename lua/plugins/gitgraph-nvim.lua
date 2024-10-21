---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>gl",
        function()
            require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        mode = "n",
        desc = "GitGraph - Draw",
    },
}

---@type I.GGConfig
local opts = {
    symbols = {
        merge_commit = "",
        commit = "",
        merge_commit_end = "",
        commit_end = "",

        -- Advanced symbols
        GVER = "",
        GHOR = "",
        GCLD = "",
        GCRD = "╭",
        GCLU = "",
        GCRU = "",
        GLRU = "",
        GLRD = "",
        GLUD = "",
        GRUD = "",
        GFORKU = "",
        GFORKD = "",
        GRUDCD = "",
        GRUDCU = "",
        GLUDCD = "",
        GLUDCU = "",
        GLRDCL = "",
        GLRDCR = "",
        GLRUCL = "",
        GLRUCR = "",
    },
    format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
    hooks = {
        on_select_commit = function(commit)
            print("selected commit:", commit.hash)
        end,
        on_select_range_commit = function(from, to)
            print("selected range:", from.hash, to.hash)
        end,
    },
}

---@type LazySpec
local spec = {
    "isakbm/gitgraph.nvim",
    --lazy = false,
    cmd = "GitGraph",
    keys = keys,
    dependencies = { "sindrets/diffview.nvim" },
    config = function()
        local gitgraph = require("gitgraph")
        gitgraph.setup(opts)

        -- Define user command
        vim.api.nvim_create_user_command("GitGraph", function()
            gitgraph.draw({}, { all = true, max_count = 5000 })
        end, {})
    end,
    --cond = false,
}

return spec
