local g = vim.g
local o = vim.o

-- Enable 24-bit RGP color in the TUI.
o.termguicolors = true

-- Time in milliseconds to wait for a mapped sequence to complete.
o.timeoutlen = 500

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 1

-- Better editor UI
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.signcolumn = 'yes:1'
o.cursorline = true
o.linebreak = true

o.expandtab = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard:append('unnamedplus')

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
-- o.backup = false
-- o.writebackup = false
-- o.undofile = true
-- o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 500

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = 'stack'

-- Stable buffer content on window open/close events.
o.splitkeep = 'screen'

-- Smooth scrolling
o.smoothscroll = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Add - to the kyword character set. This is for JoveNotes highlighting
vim.opt.iskeyword:append( '@-@' )

-- Append fzf path to runtimepath
vim.opt.rtp:append( '/opt/homebrew/opt/fzf' )

