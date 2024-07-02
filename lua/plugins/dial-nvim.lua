local dial_manipulate = require("dial.map").manipulate

vim.keymap.set("n", "<C-a>", function()
    dial_manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    dial_manipulate("decrement", "normal")
end)
