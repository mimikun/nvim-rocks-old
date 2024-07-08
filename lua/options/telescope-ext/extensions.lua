local extensions = {
    frecency = require("options.telescope-ext.frecency"),
    smart_open = require("options.telescope-ext.smart-open"),
    --glyph = require("options.telescope-ext.glyph"),
    --emoji = require("options.telescope-ext.emoji"),
    --egrepify = require("options.telescope-ext.egrepify"),
    file_browser = require("options.telescope-ext.file-browser"),
    package_info = require("options.telescope-ext.package-info"),
    zoxide = require("options.telescope-ext.zoxide"),
    undo = require("options.telescope-ext.undo"),
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(extensions, { fzf = require("options.telescope-ext.fzf") })
    table.insert(extensions, { media = require("options.telescope-ext.media") })
end

return extensions
