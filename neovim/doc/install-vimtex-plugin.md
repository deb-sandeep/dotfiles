# 1. Install Mactex
> brew install --cask mactex

# 2. Install skim - PDF viewer
> brew install --cask skim

# 3. Append the TeX/texbin folder to PATH in .zshrc
> export PATH=$PATH:/Library/TeX/texbin/

# 4. Clone a test latex repo to ~/temp/
> git clone https://github.com/jeremypedersen/latexHints.git

# 5. Add this section to ~/.config/nvim/lua/plugins/init.lua
{
    "lervag/vimtex",
    lazy=false,
    init=function ()
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_syntax_enabled = 0
    end
},

# 6. Change skim configuration for sync
Sync > PDF-TeX Sync support:
Preset : Custom
Command : nvim
Arguments : --headless -c "VimtexInverseSearch %line '%file'"

--------------
[Links]

* https://dr563105.github.io/blog/skim-vimtex-setup/
* https://github.com/lervag/vimtex
* https://www.tug.org/mactex/

