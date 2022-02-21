-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/songtianxiang/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/songtianxiang/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/songtianxiang/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/songtianxiang/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/songtianxiang/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nÒ\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\rmappings\1\0\3\nextra\2\rextended\2\nbasic\2\nextra\1\0\3\nabove\bgcO\beol\bgcA\nbelow\bgco\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28packages.configs.sfterm\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["NeoZoom.lua"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/NeoZoom.lua",
    url = "https://github.com/nyngwang/NeoZoom.lua"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameá\4\0\0\f\0\23\1U4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0005\5\5\0009\6\4\1=\6\2\5B\2\3\2\21\2\2\0006\3\0\0009\3\1\0039\3\3\3)\5\0\0005\6\a\0009\a\6\1=\a\2\6B\3\3\2\21\3\3\0006\4\0\0009\4\1\0049\4\3\4)\6\0\0005\a\t\0009\b\b\1=\b\2\aB\4\3\2\21\4\4\0006\5\0\0009\5\1\0059\5\3\5)\a\0\0005\b\v\0009\t\n\1=\t\2\bB\5\3\2\21\5\5\0\b\2\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\15\0'\n\14\0\18\v\2\0&\n\v\n=\n\16\tB\6\3\1\b\3\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\18\0'\n\17\0\18\v\3\0&\n\v\n=\n\16\tB\6\3\1\b\5\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\20\0'\n\19\0\18\v\5\0&\n\v\n=\n\16\tB\6\3\1\b\4\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\22\0'\n\21\0\18\v\4\0&\n\v\n=\n\16\tB\6\3\1L\0\2\0\1\0\1\nguifg\f#7EA9A7\n ÔÑ© \1\0\1\nguifg\f#A3BA5E\n Ôäú \1\0\1\nguifg\f#EFB839\n Ôî© \ttext\1\0\1\nguifg\f#EC5241\n Ôôô \vinsert\ntable\1\0\0\tHINT\1\0\0\tINFO\1\0\0\tWARN\1\0\0\nERROR\bget\rseverity\15diagnostic\bvim\0§\r\1\0\6\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0003\4\4\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\t\0003\5\b\0=\5\n\4=\4\v\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0'\2\16\0B\0\2\1K\0\1\0õ\a\t\t\t\tnnoremap <silent><leader>n :BufferLineCycleNext<CR>\n\t\t\t\tnnoremap <silent><leader>p :BufferLineCyclePrev<CR>\n\t\t\t\tnnoremap <silent><leader>N :BufferLineMoveNext<CR>\n\t\t\t\tnnoremap <silent><leader>P :BufferLineMovePrev<CR>\n\t\t\t\tnnoremap <silent><leader>be :BufferLineSortByExtension<CR>\n\t\t\t\tnnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>\n\t\t\t\tnnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>\n\t\t\t\tnnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>\n\t\t\t\tnnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>\n\t\t\t\tnnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>\n\t\t\t\tnnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>\n\t\t\t\tnnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>\n\t\t\t\tnnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>\n\t\t\t\tnnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>\n\t\t\t\tnnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>\n\t\t\t\bcmd\bvim\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\rfiletype\rNvimTree\ttext\22Êó©ÁÇπ‰ºëÊÅØ üôÑ\15text_align\nright\19name_formatter\0\1\0\23\19indicator_icon\tüò≠\fsort_by\23relative_directory\27always_show_bufferline\2\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\25enforce_regular_tabs\1\20separator_style\nslant!diagnostics_update_in_insert\1\24persist_buffer_sort\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ®\22left_trunc_marker\bÔÇ©\15close_icon   Curiouser and curiouser  \18modified_icon\b‚óè\22buffer_close_icon\5\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/hrsh7th/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\n¶\a\0\0\5\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0005\4\r\0=\4\5\3=\3\14\0025\3\15\0005\4\16\0=\4\5\3=\3\17\2B\0\2\1K\0\1\0\borg\1\2\0\0\rHeadline\1\0\a\21headline_pattern\t^%*+\17dash_pattern\r^-----+$\24codeblock_highlight\14CodeBlock\23source_pattern_end!#%+[eE][nN][dD]_[sS][rR][cC]\19dash_highlight\tDash\25source_pattern_start)#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]\18fat_headlines\2\fvimwiki\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^=+\17dash_pattern\v^---+$\24codeblock_highlight\14CodeBlock\23source_pattern_end\n^}}}$\19dash_highlight\tDash\25source_pattern_start\f^{{{%a+\18fat_headlines\2\brmd\19headline_signs\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^#+\19codeblock_sign\14CodeBlock\17dash_pattern\v^---+$\19dash_highlight\tDash\23source_pattern_end\n^```$\18fat_headlines\2\25source_pattern_start\t^```\rmarkdown\1\0\0\24headline_highlights\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^#+\17dash_pattern\v^---+$\24codeblock_highlight\14CodeBlock\23source_pattern_end\n^```$\19dash_highlight\tDash\25source_pattern_start\t^```\18fat_headlines\2\nsetup\14headlines\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31packages.configs.blankline\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÒ\4\0\0\5\0 \0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\27\0=\4\18\0035\4\28\0=\4\20\0034\4\0\0=\4\22\0034\4\0\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0024\3\0\0=\3\31\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mdeval.nvim"] = {
    config = { "\27LJ\2\n¸\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\17eval_options\6c\1\0\0\fcommand\1\0\1\19default_header>\t\t\t\t\t\t#include <stdio.h>\n\t\t\t\t\t\t#include <stdlib.h>\n\t\t\t\t\t\t\1\a\0\0\bgcc\r-std=c89\b-O0\n-Wall\f-Werror\14-pedantic\1\0\1\25require_confirmation\1\nsetup\vmdeval\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/mdeval.nvim",
    url = "https://github.com/jubnzv/mdeval.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n®\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\23server_uninstalled\b‚úó\19server_pending\b‚ûú\21server_installed\b‚úì\rsettings\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 packages.configs.slspconfig\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29packages.configs.snotify\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31packages.configs.nvim_tree\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n◊\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\15maintained\17sync_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n¡\3\0\0\4\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\0024\3\0\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0B\0\1\1K\0\1\0\tload\16diagnostics\1\0\3\14undercurl\2\15background\1\vdarker\1\15highlights\vcolors\15code_style\1\0\5\14variables\16bold,italic\fstrings\vitalic\rcomments\16italic,bold\14functions\26bold,italic,undercurl\rkeywords\tbold\22toggle_style_list\1\b\0\0\tdark\vdarker\tcool\tdeep\twarm\vwarmer\nlight\1\0\5\21toggle_style_key\15<leader>ts\18ending_tildes\1\16term_colors\2\16transparent\1\nstyle\tdark\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\n0\0\1\5\0\3\0\0066\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\1L\0\2\0\b‚ô•\vinsert\ntableQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\0\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30packages.configs.sorgmode\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/pears.nvim",
    url = "https://github.com/steelsojka/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  sniprun = {
    config = { "\27LJ\2\nô\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\3=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\19\0009\0\20\0009\0\21\0'\2\26\0'\3\23\0'\4\27\0005\5\28\0B\0\5\0016\0\19\0009\0\20\0009\0\21\0'\2\26\0'\3\29\0'\4\24\0005\5\30\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\15<leader>rr\1\0\1\vsilent\2\26<Plug>SnipRunOperator\6n\1\0\1\vsilent\2\18<Plug>SnipRun\14<leader>r\6v\20nvim_set_keymap\bapi\bvim\19show_no_output\1\2\0\0\15NvimNotify\20display_options\1\0\2\19terminal_width\3-\25notification_timeout\3Ù\3\fdisplay\1\4\0\0\18VirtualTextOk\19VirtualTextErr\15NvimNotify\24interpreter_options\17GFM_original\1\0\0\21use_on_filetypes\1\0\0\1\2\0\0\20markdown.pandoc\17repl_disable\16repl_enable\26selected_interpreters\1\0\3\20inline_messages\3\0\fborders\vsingle\21live_mode_toggle\boff\nsetup\fsniprun\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&packages.configs.ssymbols_outline\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÑ\t\0\0\t\0!\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\21\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0005\5\a\0=\5\b\0045\5\r\0006\6\t\0009\6\n\0069\6\v\6'\b\f\0B\6\2\2=\6\14\0056\6\t\0009\6\n\0069\6\v\6'\b\15\0B\6\2\2=\6\16\0056\6\t\0009\6\n\0069\6\v\6'\b\17\0B\6\2\2=\6\18\5=\5\19\4=\4\20\3=\3\22\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\24\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\5\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\20\0B\0\2\0016\0\t\0009\0\25\0'\2\26\0B\0\2\0016\0\t\0009\0\27\0009\0\28\0'\2\29\0'\3\30\0'\4\31\0005\5 \0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2E<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>\15<leader>fn\6n\20nvim_set_keymap\bapiø\3\t\t\t\tnnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>\n\t\t\t\tnnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>\n\t\t\t\tnnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>\n\t\t\t\tnnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>\n\t\t\t\tnnoremap <leader>fp :Telescope packer<cr>\n\t\t\t\t\" nnoremap <leader>fn <cmd>lua require('telescope').extensions.frecency()<cr>\n\t\t\t\bcmd\vpacker\19load_extension\15extensions\1\0\0\rfrecency\15workspaces\ttcpl\17~/learn/tcpl\vconfig\14~/.config\tnvim\1\0\0\19~/.config/nvim\vexpand\afn\bvim\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\3\21disable_devicons\1\19show_unindexed\2\16show_scores\1\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nŒ\5\0\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\nsigns\1\0\5\thint\bÔ†µ\16information\bÔëâ\fwarning\bÔî©\nerror\bÔôô\nother\bÔ´†\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\nclose\6q\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\vcancel\n<esc>\tnext\6j\frefresh\6r\rprevious\6k\fpreview\6p\1\0\15\tmode\26workspace_diagnostics\fpadding\2\ngroup\2\25use_diagnostic_signs\1\nicons\2\14auto_fold\1\17auto_preview\2\15auto_close\2\14auto_open\2\17indent_lines\2\16fold_closed\bÔë†\14fold_open\bÔëº\nwidth\0032\vheight\3\n\rposition\vbottom\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1P\0=\1\2\0K\0\1\0\24vista_sidebar_width\6g\bvim\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nı\5\0\0\5\0%\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0005\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\22\0025\3\24\0005\4\23\0=\4\25\0035\4\26\0=\4\27\3=\3\28\0025\3\29\0=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\3=\3$\2B\0\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\vborder\tnone\rposition\vbottom\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\14separator\b‚ûú\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\rtriggers\tauto\14show_help\2\19ignore_missing\1\fpresets\1\0\a\bnav\2\fwindows\2\17text_objects\2\fmotions\2\14operators\2\6g\2\6z\2\rspelling\1\0\2\16suggestions\3\20\fenabled\2\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/songtianxiang/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nı\5\0\0\5\0%\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0005\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\22\0025\3\24\0005\4\23\0=\4\25\0035\4\26\0=\4\27\3=\3\28\0025\3\29\0=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\3=\3$\2B\0\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\vborder\tnone\rposition\vbottom\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\14separator\b‚ûú\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\rtriggers\tauto\14show_help\2\19ignore_missing\1\fpresets\1\0\a\bnav\2\fwindows\2\17text_objects\2\fmotions\2\14operators\2\6g\2\6z\2\rspelling\1\0\2\16suggestions\3\20\fenabled\2\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n◊\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\15maintained\17sync_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÒ\4\0\0\5\0 \0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\27\0=\4\18\0035\4\28\0=\4\20\0034\4\0\0=\4\22\0034\4\0\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0024\3\0\0=\3\31\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&packages.configs.ssymbols_outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nÒ\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\rmappings\1\0\3\nextra\2\rextended\2\nbasic\2\nextra\1\0\3\nabove\bgcO\beol\bgcA\nbelow\bgco\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\4\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\0024\3\0\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0B\0\1\1K\0\1\0\tload\16diagnostics\1\0\3\14undercurl\2\15background\1\vdarker\1\15highlights\vcolors\15code_style\1\0\5\14variables\16bold,italic\fstrings\vitalic\rcomments\16italic,bold\14functions\26bold,italic,undercurl\rkeywords\tbold\22toggle_style_list\1\b\0\0\tdark\vdarker\tcool\tdeep\twarm\vwarmer\nlight\1\0\5\21toggle_style_key\15<leader>ts\18ending_tildes\1\16term_colors\2\16transparent\1\nstyle\tdark\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28packages.configs.sfterm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\n0\0\1\5\0\3\0\0066\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\1L\0\2\0\b‚ô•\vinsert\ntableQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\0\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
try_loadstring("\27LJ\2\nô\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\3=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\19\0009\0\20\0009\0\21\0'\2\26\0'\3\23\0'\4\27\0005\5\28\0B\0\5\0016\0\19\0009\0\20\0009\0\21\0'\2\26\0'\3\29\0'\4\24\0005\5\30\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\15<leader>rr\1\0\1\vsilent\2\26<Plug>SnipRunOperator\6n\1\0\1\vsilent\2\18<Plug>SnipRun\14<leader>r\6v\20nvim_set_keymap\bapi\bvim\19show_no_output\1\2\0\0\15NvimNotify\20display_options\1\0\2\19terminal_width\3-\25notification_timeout\3Ù\3\fdisplay\1\4\0\0\18VirtualTextOk\19VirtualTextErr\15NvimNotify\24interpreter_options\17GFM_original\1\0\0\21use_on_filetypes\1\0\0\1\2\0\0\20markdown.pandoc\17repl_disable\16repl_enable\26selected_interpreters\1\0\3\20inline_messages\3\0\fborders\vsingle\21live_mode_toggle\boff\nsetup\fsniprun\frequire\0", "config", "sniprun")
time([[Config for sniprun]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÑ\t\0\0\t\0!\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\21\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0005\5\a\0=\5\b\0045\5\r\0006\6\t\0009\6\n\0069\6\v\6'\b\f\0B\6\2\2=\6\14\0056\6\t\0009\6\n\0069\6\v\6'\b\15\0B\6\2\2=\6\16\0056\6\t\0009\6\n\0069\6\v\6'\b\17\0B\6\2\2=\6\18\5=\5\19\4=\4\20\3=\3\22\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\24\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\5\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\23\0'\2\20\0B\0\2\0016\0\t\0009\0\25\0'\2\26\0B\0\2\0016\0\t\0009\0\27\0009\0\28\0'\2\29\0'\3\30\0'\4\31\0005\5 \0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2E<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>\15<leader>fn\6n\20nvim_set_keymap\bapiø\3\t\t\t\tnnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>\n\t\t\t\tnnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>\n\t\t\t\tnnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>\n\t\t\t\tnnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>\n\t\t\t\tnnoremap <leader>fp :Telescope packer<cr>\n\t\t\t\t\" nnoremap <leader>fn <cmd>lua require('telescope').extensions.frecency()<cr>\n\t\t\t\bcmd\vpacker\19load_extension\15extensions\1\0\0\rfrecency\15workspaces\ttcpl\17~/learn/tcpl\vconfig\14~/.config\tnvim\1\0\0\19~/.config/nvim\vexpand\afn\bvim\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\3\21disable_devicons\1\19show_unindexed\2\16show_scores\1\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30packages.configs.sorgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n®\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\23server_uninstalled\b‚úó\19server_pending\b‚ûú\21server_installed\b‚úì\rsettings\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: mdeval.nvim
time([[Config for mdeval.nvim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\17eval_options\6c\1\0\0\fcommand\1\0\1\19default_header>\t\t\t\t\t\t#include <stdio.h>\n\t\t\t\t\t\t#include <stdlib.h>\n\t\t\t\t\t\t\1\a\0\0\bgcc\r-std=c89\b-O0\n-Wall\f-Werror\14-pedantic\1\0\1\25require_confirmation\1\nsetup\vmdeval\frequire\0", "config", "mdeval.nvim")
time([[Config for mdeval.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nŒ\5\0\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\nsigns\1\0\5\thint\bÔ†µ\16information\bÔëâ\fwarning\bÔî©\nerror\bÔôô\nother\bÔ´†\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\nclose\6q\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\vcancel\n<esc>\tnext\6j\frefresh\6r\rprevious\6k\fpreview\6p\1\0\15\tmode\26workspace_diagnostics\fpadding\2\ngroup\2\25use_diagnostic_signs\1\nicons\2\14auto_fold\1\17auto_preview\2\15auto_close\2\14auto_open\2\17indent_lines\2\16fold_closed\bÔë†\14fold_open\bÔëº\nwidth\0032\vheight\3\n\rposition\vbottom\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1P\0=\1\2\0K\0\1\0\24vista_sidebar_width\6g\bvim\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time([[Config for pears.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29packages.configs.snotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31packages.configs.blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameá\4\0\0\f\0\23\1U4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0005\5\5\0009\6\4\1=\6\2\5B\2\3\2\21\2\2\0006\3\0\0009\3\1\0039\3\3\3)\5\0\0005\6\a\0009\a\6\1=\a\2\6B\3\3\2\21\3\3\0006\4\0\0009\4\1\0049\4\3\4)\6\0\0005\a\t\0009\b\b\1=\b\2\aB\4\3\2\21\4\4\0006\5\0\0009\5\1\0059\5\3\5)\a\0\0005\b\v\0009\t\n\1=\t\2\bB\5\3\2\21\5\5\0\b\2\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\15\0'\n\14\0\18\v\2\0&\n\v\n=\n\16\tB\6\3\1\b\3\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\18\0'\n\17\0\18\v\3\0&\n\v\n=\n\16\tB\6\3\1\b\5\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\20\0'\n\19\0\18\v\5\0&\n\v\n=\n\16\tB\6\3\1\b\4\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\22\0'\n\21\0\18\v\4\0&\n\v\n=\n\16\tB\6\3\1L\0\2\0\1\0\1\nguifg\f#7EA9A7\n ÔÑ© \1\0\1\nguifg\f#A3BA5E\n Ôäú \1\0\1\nguifg\f#EFB839\n Ôî© \ttext\1\0\1\nguifg\f#EC5241\n Ôôô \vinsert\ntable\1\0\0\tHINT\1\0\0\tINFO\1\0\0\tWARN\1\0\0\nERROR\bget\rseverity\15diagnostic\bvim\0§\r\1\0\6\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0003\4\4\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\t\0003\5\b\0=\5\n\4=\4\v\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0'\2\16\0B\0\2\1K\0\1\0õ\a\t\t\t\tnnoremap <silent><leader>n :BufferLineCycleNext<CR>\n\t\t\t\tnnoremap <silent><leader>p :BufferLineCyclePrev<CR>\n\t\t\t\tnnoremap <silent><leader>N :BufferLineMoveNext<CR>\n\t\t\t\tnnoremap <silent><leader>P :BufferLineMovePrev<CR>\n\t\t\t\tnnoremap <silent><leader>be :BufferLineSortByExtension<CR>\n\t\t\t\tnnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>\n\t\t\t\tnnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>\n\t\t\t\tnnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>\n\t\t\t\tnnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>\n\t\t\t\tnnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>\n\t\t\t\tnnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>\n\t\t\t\tnnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>\n\t\t\t\tnnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>\n\t\t\t\tnnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>\n\t\t\t\tnnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>\n\t\t\t\bcmd\bvim\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\rfiletype\rNvimTree\ttext\22Êó©ÁÇπ‰ºëÊÅØ üôÑ\15text_align\nright\19name_formatter\0\1\0\23\19indicator_icon\tüò≠\fsort_by\23relative_directory\27always_show_bufferline\2\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\25enforce_regular_tabs\1\20separator_style\nslant!diagnostics_update_in_insert\1\24persist_buffer_sort\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ®\22left_trunc_marker\bÔÇ©\15close_icon   Curiouser and curiouser  \18modified_icon\b‚óè\22buffer_close_icon\5\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 packages.configs.slspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31packages.configs.nvim_tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: headlines.nvim
time([[Config for headlines.nvim]], true)
try_loadstring("\27LJ\2\n¶\a\0\0\5\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0005\4\r\0=\4\5\3=\3\14\0025\3\15\0005\4\16\0=\4\5\3=\3\17\2B\0\2\1K\0\1\0\borg\1\2\0\0\rHeadline\1\0\a\21headline_pattern\t^%*+\17dash_pattern\r^-----+$\24codeblock_highlight\14CodeBlock\23source_pattern_end!#%+[eE][nN][dD]_[sS][rR][cC]\19dash_highlight\tDash\25source_pattern_start)#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]\18fat_headlines\2\fvimwiki\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^=+\17dash_pattern\v^---+$\24codeblock_highlight\14CodeBlock\23source_pattern_end\n^}}}$\19dash_highlight\tDash\25source_pattern_start\f^{{{%a+\18fat_headlines\2\brmd\19headline_signs\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^#+\19codeblock_sign\14CodeBlock\17dash_pattern\v^---+$\19dash_highlight\tDash\23source_pattern_end\n^```$\18fat_headlines\2\25source_pattern_start\t^```\rmarkdown\1\0\0\24headline_highlights\1\2\0\0\rHeadline\1\0\a\21headline_pattern\b^#+\17dash_pattern\v^---+$\24codeblock_highlight\14CodeBlock\23source_pattern_end\n^```$\19dash_highlight\tDash\25source_pattern_start\t^```\18fat_headlines\2\nsetup\14headlines\frequire\0", "config", "headlines.nvim")
time([[Config for headlines.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
