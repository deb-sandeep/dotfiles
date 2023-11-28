function M(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

require('sandy.settings')
require('sandy.keymaps')

vim.filetype.add({
    pattern = {
      ['.*%.jn%-ocr'] = 'jn-ocr',
      ['.*%.jn'] = 'jn',
    },
})
