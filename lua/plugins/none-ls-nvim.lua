---@type table[]
local base_sources = {
    windows = require("options.null-ls").windows,
    linux = require("options.null-ls").linux,
    minimal = require("options.null-ls").minimal,
    full = require("options.null-ls").full,
}

---@type table
local sources = base_sources.minimal

require("null-ls").setup({ sources = sources })
