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
o.shortmess:append({ I = true })
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
  hi! BuffetTab gui=bold,italic guibg=#851e3e guifg=#ffc425
  hi! BuffetCurrentBuffer gui=bold,italic,undercurl guibg=#282c34  guifg=#6fffe9
  hi! BuffetModCurrentBuffer gui=bold,italic,undercurl guibg=#282c34 guifg=#d62828
  hi! BuffetActiveBuffer gui=bold  guibg=#282c34  guifg=#ed6e5a
  hi! BuffetBuffer gui=bold  guibg=#5c374c guifg=#ed6e5a
  " hi! BuffetTrunc guibg=#e45649 guifg=#e45649 6883bc 315f72 7a2048
endfunction
]]

g.neovide_no_idle = true
g.neovide_fullscreen = true
g.neovide_remember_window_siez = true
g.neovide_input_use_logo = true
g.neovide_cursor_animation_length = 0.08
g.neovide_cursor_vxf_mode = "railgun"
