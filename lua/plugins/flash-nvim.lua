local flash = require("flash")

flash.setup({
    prompt = {
        -- TODO: Use utils/icons.lua
        --prefix = { { "⚡", "FlashPromptIcon" } },
        prefix = { { require("utils.icons").get("kind").Event, "FlashPromptIcon" } },
    },
})

vim.keymap.set({ "n", "x", "o" }, "s", function()
    flash.jump()
end)
vim.keymap.set({ "n", "x", "o" }, "S", function()
    flash.treesitter()
end)
vim.keymap.set("o", "r", function()
    flash.remote()
end)
vim.keymap.set({ "o", "x" }, "R", function()
    flash.treesitter_search()
end)
vim.keymap.set("c", "<c-s>", function()
    flash.toggle()
end)

-- NOTE: Flash HopWord
-- ref: https://github.com/folke/flash.nvim/blob/main/README.md#-examples
local function format(opts)
    return {
        { opts.match.label1, "FlashMatch" },
        { opts.match.label2, "FlashLabel" },
    }
end

vim.keymap.set("n", "<leader>h", function()
    flash.jump({
        search = { mode = "search" },
        label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
        pattern = [[\<]],
        action = function(match, state)
            state:hide()
            flash.jump({
                search = { max_length = 0 },
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                    -- limit matches to the current label
                    return vim.tbl_filter(function(m)
                        return m.label == match.label and m.win == win
                    end, state.results)
                end,
                labeler = function(matches)
                    for _, m in ipairs(matches) do
                        -- use the second label
                        m.label = m.label2
                    end
                end,
            })
        end,
        labeler = function(matches, state)
            local labels = state:labels()
            for m, match in ipairs(matches) do
                match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                match.label2 = labels[(m - 1) % #labels + 1]
                match.label = match.label1
            end
        end,
    })
end)
