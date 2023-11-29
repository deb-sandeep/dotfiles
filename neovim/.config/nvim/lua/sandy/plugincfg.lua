-- nvim-tree
-- - Don't resize the window every time a buffer is opened
require( "nvim-tree" ).setup{
    view = {
        preserve_window_proportions = false,
    },
    actions = {
        open_file = {
            resize_window = false,
        },
    },
}

-- telescope
-- <leader>fs opens up live grep args
vim.keymap.set('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })


