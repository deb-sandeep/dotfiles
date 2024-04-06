-- Fix n and N. Keeping cursor in center
-- M('n', 'n', 'nzz')
-- M('n', 'N', 'Nzz')

-- Mimic shell movements
M('i', '<C-E>', '<C-o>$')
M('i', '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
M('n', '<leader>w', '<CMD>update<CR>')
M('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
M('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
M('n', '<leader>o', 'o<ESC>k')
M('n', '<leader>O', 'O<ESC>j')

-- leader-<Space> inserts a space at the current position
M('n', '<leader><space>', 'i<space><ESC>l')

-- Shift enter. Force a new line split at current position 
-- and enter insert mode
M('n', '<S-CR>', 'i<CR>')

-- Shortcut to yank register
M({ 'n', 'x' }, '<leader>p', '"0p')
M({ 'n', 'x' }, '<leader>P', '"0P')

-- Shortcut to wrap and nowrap
M('n', '<leader>wr', ':set wrap<CR>')
M('n', '<leader>nr', ':set nowrap<CR>')

-- Copying the vscode behaviour of making tab splits
M('n', '<C-\\>', '<CMD>vsplit<CR>')
M('n', '<A-\\>', '<CMD>split<CR>')

-- Block the arrow keys :)
M('', '<up>', '<nop>')
M('', '<down>', '<nop>')
M('', '<left>', '<nop>')
M('', '<right>', '<nop>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
M('n', '<leader>jj', '<CMD>move .+1<CR>')
M('n', '<leader>kk', '<CMD>move .-2<CR>')
