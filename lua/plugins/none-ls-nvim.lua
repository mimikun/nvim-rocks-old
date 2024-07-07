---@type table[]
local base_sources = {
    windows = require("sources.null-ls").windows,
    linux = require("sources.null-ls").linux,
    minimal = require("sources.null-ls").minimal,
    full = require("sources.null-ls").full,
}

---@type table
local sources = base_sources.minimal

require("null-ls").setup({ sources = sources })
