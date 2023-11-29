-- A handy method to set keymap
function M(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Load the refactored configurations
-- This has vim option settings
require('sandy.settings')

-- Keymaps which apply to all the files.
-- For filetype/buffer specific mappings refer to ftplugin files
require('sandy.keymaps')

-- Any config changes for standard plugins
require('sandy.plugincfg')

-- Autocommand setting for file types. This will cause
-- the syntax and ftplugins to load for custom file types
vim.filetype.add({
    pattern = {
      ['.*%.jn%-ocr'] = 'jn-ocr',
      ['.*%.jn'] = 'jn',
    },
})
