-- vim: foldmethod=marker
-- 导入vim{{{
local o = vim.opt
local g = vim.g
--}}}

---------------------------------------------------------------------------
-- 一般选项 local buffer window ...
--λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
--
o.termguicolors = true
o.number = true
o.relativenumber = true
o.incsearch = true
o.hls = true
o.ignorecase = true
o.smartcase = true
o.belloff = "all"
o.smarttab = true
o.autoindent = true
o.smartindent = true
o.shiftround = true
o.expandtab = true
o.shiftwidth = 8
o.softtabstop = 8
o.tabstop = 8
o.splitbelow = true
o.splitright = true
o.scrolloff = 10
o.hidden = true
o.whichwrap = "b,s,<,>,h,l"
o.completeopt = {"menu", "menuone", "noselect"}


---------------------------------------------------------------------------
-- 全局选项 global
--λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
--
-- g.colorscheme = "onedark"
g.mapleader = ";"

-- buffet
vim.cmd [[
function! g:BuffetSetCustomColors()
  hi! BuffetTab cterm=bold,italic ctermbg=0 ctermfg=2 guibg=#315f72 guifg=#7a2048
  hi! BuffetCurrentBuffer cterm=italic,undercurl guibg=#282c34  guifg=#98c379
  hi! BuffetModCurrentBuffer cterm=italic,undercurl guibg=#282c34 guifg=#61afef
  hi! BuffetActiveBuffer cterm=bold  guibg=#282c34  guifg=#98c379
  hi! BuffetBuffer cterm=bold  guibg=#6883bc guifg=#282c34
  " hi! BuffetTrunc guibg=#e45649 guifg=#e45649 6883bc
endfunction
]]
