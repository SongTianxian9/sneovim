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
o.history = 10000
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
-- o.expandtab = true
-- o.shiftwidth = 8
-- o.softtabstop = 8
o.tabstop = 8
o.splitbelow = true
o.splitright = true
o.scrolloff = 10
o.textwidth = 80
o.hidden = true
o.autochdir = true
o.whichwrap = "b,s,<,>,h,l"
o.completeopt = {"menu", "menuone", "noselect"}
o.mouse = "a"
vim.cmd[[

" set guifont="Firacode\Nerd\Font\ Mono\Retina:h14"
set guifont=JetBrainsMono\ Nerd\ Font:h14
]]


---------------------------------------------------------------------------
-- 全局选项 global
--λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
--
-- g.colorscheme = "onedark"
g.mapleader = ";"

-- buffet
vim.cmd [[
function! g:BuffetSetCustomColors()
  hi! BuffetTab gui=bold,italic guibg=#315f72 guifg=#7a2048
  hi! BuffetCurrentBuffer gui=italic,undercurl guibg=#282c34  guifg=#98c379
  hi! BuffetModCurrentBuffer gui=italic,undercurl guibg=#282c34 guifg=#61afef
  hi! BuffetActiveBuffer gui=bold  guibg=#282c34  guifg=#98c379
  hi! BuffetBuffer gui=bold  guibg=#6883bc guifg=#282c34
  " hi! BuffetTrunc guibg=#e45649 guifg=#e45649 6883bc
endfunction
]]

g.neovide_no_idle = true
g.neovide_fullscreen = true
g.neovide_remember_window_siez = true
g.neovide_input_use_logo = true
g.neovide_cursor_animation_length = 0.48
g.neovide_cursor_vxf_mode = "railgun"
