---@type table
local opts = {
    path = vim.fs.normalize(vim.fn.stdpath("data")) .. "/huez",
    suppress_messages = true,
    exclude = {
        "desert",
        "evening",
        "industry",
        "koehler",
        "morning",
        "murphy",
        "pablo",
        "peachpuff",
        "ron",
        "shine",
        "slate",
        "torte",
        "zellner",
        "blue",
        "darkblue",
        "delek",
        "quiet",
        "elflord",
        "habamax",
        "lunaperche",
        "zaibatsu",
        "wildcharm",
        "sorbet",
        "vim",
    },
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    cmd = cmds,
    opts = opts,
    enabled = false,
    cond = false,
}

return spec
