vim.cmd [[
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim'    
Plug 'morhetz/gruvbox'
    
Plug 'https://github.com/ap/vim-css-color'

Plug 'https://github.com/junegunn/limelight.vim'

Plug 'https://github.com/jremmen/vim-ripgrep'

Plug 'https://github.com/terryma/vim-multiple-cursors'

Plug 'https://github.com/junegunn/goyo.vim'

Plug 'vimwiki/vimwiki'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()
]]


if vim.env.TMUX == nil then
    if vim.fn.has("nvim") then
        vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
    end
    if vim.fn.has("termguicolors") then
        vim.o.termguicolors = true
    end
end


vim.g.vimwiki_list = {
    {
        path = '$HOME/Documents/vimwiki/',
        syntax = 'markdown',
        ext = 'md'
    }
}


--basic settings
vim.cmd('syntax on') --enables syntax highlight
vim.cmd('set nocompatible')
vim.o.expandtab = true --spaces instead of tabs
vim.o.tabstop = 4 --4 spaces for tab
vim.o.shiftwidth = 4 --autotab width
vim.o.swapfile = false --disable swapfile
vim.cmd('filetype plugin indent on')
vim.o.encoding = 'utf-8'
vim.o.hidden = true --hide buffers with unsaved changes
vim.o.backup = false --this
vim.o.writebackup = false --and this disable backups
vim.o.updatetime = 300 --idle time for status bar update
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.scrolloff = 99 --scrolling with cursor
vim.o.guicursor = 'n:block-Cursor,i:hor20-Cursor'
vim.o.wildmenu = true --menu with Tab for command input
vim.o.hls = true --this
vim.o.is = true --and this enable highlighting words while searching
vim.o.lc = true
vim.o.cmdheight = 1
vim.o.formatoptions = 'tcqrn1'
vim.o.lbr = true --softwrap
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus' --enable copying from nvim to system buffer
vim.o.mouse = '' --disable mouse
vim.opt.spelllang = 'en_us'
vim.opt.spell = true


--colorscheme +airline colorscheme
vim.cmd('colorscheme nord')
vim.g['airline_theme'] = 'nord_minimal'


--limelight
vim.g.limelight_conceal_guifg = '#3B4252'


--keybindings
vim.api.nvim_set_keymap('n', '<M-q>', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-w>', ':w<CR>', {noremap = true})


--limelight keybindings
vim.api.nvim_set_keymap('n', '<C-g>', ':Limelight <bar> :Goyo 120<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':Limelight! <bar> :Goyo!<CR>', {noremap = true})


--MarkdownPreview keybindings
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>MarkdownPreview', {})
vim.api.nvim_set_keymap('n', '<M-s>', '<Plug>MarkdownPreviewStop', {})
vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>MarkdownPreviewToggle', {})
