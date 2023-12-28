local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim'

Plug 'ap/vim-css-color'

Plug 'yavko/minimap.nvim'

vim.call ('plug#end')


if vim.env.TMUX == nil then
    if vim.fn.has("nvim") then
        vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
    end
    if vim.fn.has("termguicolors") then
        vim.o.termguicolors = true
    end
end


--basic settings
vim.cmd('syntax on') --enables syntax highlight
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
vim.o.cmdheight = 2
vim.o.formatoptions = 'tcqrn1'
vim.o.lbr = true --softwrap
vim.wo.number = true --number of line
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus' --enable copying from nvim to system buffer
vim.o.mouse = '' --disable mouse


--colorscheme +airline colorscheme
vim.cmd('colorscheme nord')
vim.g['airline_theme'] = 'nord_minimal'


if vim.fn.has("nvim-0.5.0") or vim.fn.has("patch-8.1.1564") then
  vim.o.signcolumn = 'number'
else
  vim.o.signcolumn = 'yes'
end


vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : CheckBackspace() ? "<TAB>" : coc#refresh()', {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', {expr = true})


function CheckBackspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):find('%s') ~= nil
end


if vim.fn.has('nvim') then
    vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', {expr = true, silent = true})
else
    vim.api.nvim_set_keymap('i', '<C-@>', 'coc#refresh()', {expr = true, silent = true})
end


vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR>"', {expr = true, silent = true})

vim.api.nvim_set_keymap('n', '<M-q>', ':q<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<M-w>', ':w<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'K', [[:call ShowDocumentation()<CR>]], {noremap = true, silent = true})

function ShowDocumentation()
  if vim.fn['coc#rpc#has_provider']('hover') == 1 then
    vim.fn['CocActionAsync']('doHover')
  else
    vim.fn['feedkeys']('K', 'in')
  end
end

vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])

vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {noremap = true})

vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true})

vim.cmd([[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]])

vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {noremap = true})

vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', {noremap = true})
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', {noremap = true})
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', {noremap = true})
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', {noremap = true})
vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', {noremap = true})
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', {noremap = true})
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', {noremap = true})
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', {noremap = true})

if vim.fn.has('nvim-0.4.0') or vim.fn.has('patch-8.2.0750') then
  vim.api.nvim_set_keymap('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true, silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true, silent = true, nowait = true})
  vim.api.nvim_set_keymap('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', {expr = true, silent = true, nowait = true})
  vim.api.nvim_set_keymap('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', {expr = true, silent = true, nowait = true})
  vim.api.nvim_set_keymap('x', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true, silent = true, nowait = true})
  vim.api.nvim_set_keymap('x', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true, silent = true, nowait = true})
end

vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

vim.cmd([[command! -nargs=0 Format :call CocActionAsync('format')]])
vim.cmd([[command! -nargs=? Fold :call CocAction('fold', <f-args>)]])

vim.cmd([[command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')]])

vim.o.statusline = vim.o.statusline .. '%{coc#status()}%{get(b:,"coc_current_function","")}'

vim.api.nvim_set_keymap('n', '<space>a', ':<C-u>CocList diagnostics<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>e', ':<C-u>CocList extensions<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>c', ':<C-u>CocList commands<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList outline<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>j', ':<C-u>CocNext<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>k', ':<C-u>CocPrev<CR>', {silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<space>p', ':<C-u>CocListResume<CR>', {silent = true, nowait = true})


vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_highlight_search = 1
vim.g.minimap_git_colors = 1
