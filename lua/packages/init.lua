-- vim: foldmethod=marker
----λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
-- Packer 安装及初始化--{{{
    ----------------------------------------------------------------------
    -- Packer 安装{{{
local fn = vim.fn
local packer_bootstrap

local present, packer = pcall(require, 'packer')

if not present then
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    print("本机上未找到 Packer，将为你安装 ")
    print("正在帮你克隆：packer ....")

    packer_bootstrap = fn.system {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "1",
        install_path,
    }

    vim.cmd [[packadd packer.nvim]]
    present, packer = pcall(require, 'packer')

    if present then
        print "Packer 克隆成功咯～～"
    else
        error("Packer 克隆失败呵！！\nPacker 路径是：" .. install_path .. "\n" .. packer)
    end
end--}}}
    ----------------------------------------------------------------------
    -- Packer 初始化{{{

packer.init {
    -- ensure_dependencies   = true, -- 是否安装插件依赖
    -- -- package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    -- -- compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    -- plugin_package = 'packer', -- The default package for plugins
    -- max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
    -- auto_clean = true, -- During sync(), remove unused plugins
    -- compile_on_sync = true, -- During sync(), run packer.compile()
    -- disable_commands = false, -- Disable creating commands
    -- opt_default = false, -- Default to using opt (as opposed to start) plugins
    -- transitive_opt = true, -- Make dependencies of opt plugins also opt by default
    -- transitive_disable = true, -- Automatically disable dependencies of disabled plugins
    -- auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
        git = {
                cmd = 'git', -- The base command for git operations
                subcommands = { -- Format strings for git subcommands
                        update         = 'pull --ff-only --progress --rebase=false',
                        install        = 'clone --depth %i --no-single-branch --progress',
                        fetch          = 'fetch --depth 999999 --progress',
                        checkout       = 'checkout %s --',
                        update_branch  = 'merge --ff-only @{u}',
                        current_branch = 'branch --show-current',
                        diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
                        diff_fmt       = '%%h %%s (%%cr)',
                        get_rev        = 'rev-parse --short HEAD',
                        get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
                        submodules     = 'submodule update --init --recursive --progress'
                },
                depth = 1, -- Git clone depth
                clone_timeout = 600, -- Timeout, in seconds, for git clones
                default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
    -- display = {
    -- non_interactive = false, -- If true, disable display windows for all operations
    -- open_fn  = nil, -- An optional function to open a window for packer's display
    -- open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    -- working_sym = '⟳', -- The symbol for a plugin being installed/updated
    -- error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    -- done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    -- removed_sym = '-', -- The symbol for an unused plugin which was removed
    -- moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    -- header_sym = '━', -- The symbol for the header line in packer's display
    -- show_all_info = true, -- Should packer show all update details automatically?
    -- prompt_border = 'double', -- Border style of prompt popups.
    -- keybindings = { -- Keybindings for the display window
    --     quit = 'q',
    --     toggle_info = 'λCR>',
    --     diff = 'd',
    --     prompt_revert = 'r',
    -- }
    -- },
    -- luarocks = {
    -- python_cmd = 'python' -- Set the python command to use for running hererocks
    -- },
    -- log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
    -- profile = {
    -- enable = false,
    -- threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
}

-- function()
--     return require("packer.util").float { border = "single" }
-- end,}}}}}}
----λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ

----λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
-- Packer 插件配置项{{{
return packer.startup(function(use)--{{{
        use {
                'wbthomason/packer.nvim',--{{{
                -- opt = true,
                -- cmd = {"PackerSync", "PackerCompile", },
        }--}}}}}}
    ----------------------------------------------------------------------
        -- 配置项：{{{
        -- use {
        --     'myusername/example',        -- The plugin location string
        --     -- The following keys are all optional
        --     disable = boolean,           -- Mark a plugin as inactive
        --     as = string,                 -- Specifies an alias under which to install the plugin
        --     installer = function,        -- Specifies custom installer. See "custom installers" below.
        --     updater = function,          -- Specifies custom updater. See "custom installers" below.
        --     after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
        --     rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
        --     opt = boolean,               -- Manually marks a plugin as optional.
        --     branch = string,             -- Specifies a git branch to use
        --     tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
        --     commit = string,             -- Specifies a git commit to use
        --     lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
        --     run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
        --     requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
        --     rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
        --     config = string or function, -- Specifies code to run after this plugin is loaded.
        --     -- The setup key implies opt = true
        --     setup = string or function,  -- Specifies code to run before this plugin is loaded.
        --     -- The following keys all imply lazy-loading and imply opt = true
        --     cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
        --     ft = string or list,         -- Specifies filetypes which load this plugin.
        --     keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
        --     event = string or list,      -- Specifies autocommand events which load this plugin.
        --     fn = string or list          -- Specifies functions which load this plugin.
        --     cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
        --     module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
        --                                 -- with one of these module names, the plugin will be loaded.
        --     module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
        --     requiring a string which matches one of these patterns, the plugin will be loaded.
        -- }}}}
        --
        -- 示例：{{{
        -- -- This file can be loaded by calling `lua require('plugins')` from your init.vim
        -- -- Only required if you have packer configured as `opt`
        -- vim.cmd [[packadd packer.nvim]]
        --
        -- return require('packer').startup(function()
        -- -- Packer can manage itself
        -- use 'wbthomason/packer.nvim'
        --
        -- -- Simple plugins can be specified as strings
        -- use '9mm/vim-closer'
        --
        -- -- Lazy loading:
        -- -- Load on specific commands
        -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
        --
        -- -- Load on an autocommand event
        -- use {'andymass/vim-matchup', event = 'VimEnter'}
        --
        -- -- Load on a combination of conditions: specific filetypes or commands
        -- -- Also run code after load (see the "config" key)
        -- use {
        -- 'w0rp/ale',
        -- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
        -- cmd = 'ALEEnable',
        -- config = 'vim.cmd[[ALEEnable]]'
        -- }
        --
        -- -- Plugins can have dependencies on other plugins
        -- use {
        -- 'haorenW1025/completion-nvim',
        -- opt = true,
        -- requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
        -- }
        --
        -- -- Plugins can also depend on rocks from luarocks.org:
        -- use {
        -- 'my/supercoolplugin',
        -- rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
        -- }
        --
        -- -- You can specify rocks in isolation
        -- use_rocks 'penlight'
        -- use_rocks {'lua-resty-http', 'lpeg'}
        --
        -- -- Local plugins can be included
        -- use '~/projects/personal/hover.nvim'
        --
        -- -- Plugins can have post-install/update hooks
        -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
        --
        -- -- Post-install/update hook with neovim command
        -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        --
        -- -- Post-install/update hook with call of vimscript function with argument
        -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
        --
        -- -- Use specific branch, dependency and run lua file after load
        -- use {
        -- 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
        -- requires = {'kyazdani42/nvim-web-devicons'}
        -- }
        --
        -- -- Use dependency and run lua function after load
        -- use {
        -- 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        -- config = function() require('gitsigns').setup() end
        -- }
        --
        -- -- You can specify multiple plugins in a single call
        -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
        --
        -- -- You can alias plugin names
        -- use {'dracula/vim', as = 'dracula'}
        -- end)}}}}}}
    ----------------------------------------------------------------------

        -- LSP{{{
        -- 客户端，自动补全
        use {
                'p00f/clangd_extensions.nvim',--{{{
        }--}}}

        use {
                'neovim/nvim-lspconfig',--{{{
                requires = {
                        {'hrsh7th/nvim-cmp',},
                        {'L3MON4D3/LuaSnip', },
                        {'saadparwaiz1/cmp_luasnip', },
                        {'rafamadriz/friendly-snippets', },
                        {'hrsh7th/cmp-nvim-lsp'},
                        {'hrsh7th/cmp-buffer', },
                        {'hrsh7th/cmp-path', },
                        {'hrsh7th/cmp-cmdline', },
                        {'hrsh7th/cmp-git', },
                        -- {'hrsh7th/cmp-vsnip', },
                        -- {'hrsh7th/vim-vsnip', },
                        {"ray-x/lsp_signature.nvim", },
                        {'onsails/lspkind-nvim', },
                },
                config = function()
                        require 'packages.configs.slspconfig'
                end,
        }

        --}}}
        --
        use {
                'williamboman/nvim-lsp-installer',--{{{
                config = function()
                        require("nvim-lsp-installer").settings({
                                ui = {
                                        icons = {
                                        server_installed = "✓",
                                        server_pending = "➜",
                                        server_uninstalled = "✗"
                                        },
                                },
                        })

                end
        }--}}}

        -- }}}

        -- UI{{{
        -- use {
        --         "monsonjeremy/onedark.nvim",--{{{
        --         config = function()
        --                 require('onedark').setup({
        --                         functionStyle = "italic",
        --                         -- variableStyle = "italic",
        --                         hideInactiveStatusline = true,
        --                         -- sidebars = {"qf", "vista_kind", "terminal", "packer"},
        --                         -- colors = {hint = "orange", error = "#ff0000"}
        --                         customTelescope = true,
        --                 })
        --         end,
        -- }--}}}

        use {
                'navarasu/onedark.nvim',--{{{
                config = function()
                        require('onedark').setup  {
                                -- Main options --
                                style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                                transparent = false,  -- Show/hide background
                                term_colors = true, -- Change terminal color as per the selected theme style
                                ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
                                -- toggle theme style ---
                                toggle_style_key = '<leader>ts', -- Default keybinding to toggle
                                toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

                                -- Change code style ---
                                -- Options are italic, bold, underline, none
                                -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
                                code_style = {
                                        comments = 'italic,bold',
                                        keywords = 'bold',
                                        functions = 'bold,italic,undercurl',
                                        strings = 'italic',
                                        variables = 'bold,italic'
                                },

                                -- Custom Highlights --
                                colors = {}, -- Override default colors
                                highlights = {
                                        -- IndentBlanklineIndent1 = {guibg = "#1f1f1f", gui = "nocombine", },
                                        -- IndentBlanklineIndent2 = {guibg = "#1a1a1a", gui = "nocombine", },
                                }, -- Override highlight groups

                                -- Plugins Config --
                                diagnostics = {
                                        darker = false, -- darker colors for diagnostic
                                        undercurl = true,   -- use undercurl instead of underline for diagnostics
                                        background = false,    -- use background color for virtual text
                                },
                        }
                        require('onedark').load()
                end,
        }--}}}

        use {
                'nvim-lualine/lualine.nvim',--{{{
                requires = {--[[ {'nvim-lua/lsp-status.nvim', }, ]] { 'kyazdani42/nvim-web-devicons', }, },
                config = function()
                        require('lualine').setup({
                        options = {
                                icons_enabled = true,
                                theme = 'onedark',
                                component_separators = { left = '', right = ''},
                                section_separators = { left = '', right = ''},
                                disabled_filetypes = {"NvimTree", },
                                always_divide_middle = true,
                        },
                        sections = {
                                lualine_a = {'mode'},
                                lualine_b = {'branch', 'diff', 'diagnostics'},
                                lualine_c = {'filename', --[[ {function() return require('lsp-status').status() end} ,]] },
                                lualine_x = {--[[ 'encoding', 'fileformat', ]] 'filetype'},
                                lualine_y = {'progress'},
                                lualine_z = {'location'}
                        },
                        inactive_sections = {
                                lualine_a = {},
                                lualine_b = {},
                                lualine_c = {'filename'},
                                lualine_x = {'location'},
                                lualine_y = {},
                                lualine_z = {}
                        },
                        tabline = {},
                        extensions = {}
                        })
                end,
        }--}}}

        -- use {
        --         'bagrat/vim-buffet',--{{{
        --         config = function()
        --                 require"packages.configs.buffet"
        --         end,
        -- }--}}}
        --
	--[[ use {
		'romgrk/barbar.nvim',--{{{
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function ()
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Move to previous/next
			map('n', '<A-p>', ':BufferPrevious<CR>', opts)
			map('n', '<A-n>', ':BufferNext<CR>', opts)
			-- Re-order to previous/next
			map('n', '<A-P>', ':BufferMovePrevious<CR>', opts)
			map('n', '<A-N>', ' :BufferMoveNext<CR>', opts)
			-- Goto buffer in position...
			map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
			map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
			map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
			map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
			map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
			map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
			map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
			map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
			map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
			map('n', '<A-0>', ':BufferLast<CR>', opts)
			-- Close buffer
			map('n', '<A-c>', ':BufferClose<CR>', opts)
			-- Wipeout buffer
			--                 :BufferWipeout<CR>
			-- Close commands
			--                 :BufferCloseAllButCurrent<CR>
			--                 :BufferCloseBuffersLeft<CR>
			--                 :BufferCloseBuffersRight<CR>
			-- Magic buffer-picking mode
			map('n', '<M-j>', ':BufferPick<CR>', opts)
			-- Sort automatically by...
			map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
			map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
			map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

			-- Other:
			-- :BarbarEnable - enables barbar (enabled by default)
			-- :BarbarDisable - very bad command, should never be used
		end
	}--}}} ]]

	use {
		'akinsho/bufferline.nvim',--{{{
		requires = 'kyazdani42/nvim-web-devicons',
		config = function ()
			require("bufferline").setup{
				options = {
				-- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				-- --- @deprecated, please specify numbers as a function to customize the styling
				-- number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
				close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
				-- NOTE: this plugin is designed with this icon in mind,
				-- and so changing this is NOT recommended, this is intended
				-- as an escape hatch for people who cannot bear it for whatever reason
				indicator_icon = '😭',
				buffer_close_icon = '',
				modified_icon = '●',
				close_icon = '  Curiouser and curiouser  ',
				left_trunc_marker = '',
				right_trunc_marker = '',
				--- name_formatter can be used to change the buffer's label in the bufferline.
				--- Please note some names can/will break the
				--- bufferline so use this at your discretion knowing that it has
				--- some limitations that will *NOT* be fixed.
				name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
				-- remove extension from markdown files for example
				if buf.name:match('%.md') then
					return vim.fn.fnamemodify(buf.name, ':t:r')
				end
				end,
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
				-- return "("..count..")"
				-- end,
				-- NOTE: this will be called a lot so don't do any heavy processing here
				-- custom_filter = function(buf_number, buf_numbers)
				-- -- filter out filetypes you don't want to see
				-- if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				-- 	return true
				-- end
				-- -- filter out by buffer name
				-- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				-- 	return true
				-- end
				-- -- filter out based on arbitrary rules
				-- -- e.g. filter out vim wiki buffer from tabline in your work repo
				-- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				-- 	return true
				-- end
				-- -- filter out by it's index number in list (don't show first buffer)
				-- if buf_numbers[1] ~= buf_number then
				-- 	return true
				-- end
				-- end,
				offsets = {{filetype = "NvimTree", text = "又要打开啥文件 🙄" , text_align = --[[ "left" | "center" |  ]]"right"}},
				show_buffer_icons = true , -- disable filetype icons for buffers
				show_buffer_close_icons = true ,
				show_close_icon = true ,
				show_tab_indicators = true ,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "slant" ,
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = 'relative_directory',
			custom_areas = {
				right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
				local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
				local info = #vim.diagnostic.get(0, {severity = seve.INFO})
				local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

				if error ~= 0 then
				table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
				end

				if warning ~= 0 then
				table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
				end

				if hint ~= 0 then
				table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
				end

				if info ~= 0 then
				table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
				end
				return result
				end,
			}
				},

			}
			vim.cmd[[
				nnoremap <silent><leader>n :BufferLineCycleNext<CR>
				nnoremap <silent><leader>p :BufferLineCyclePrev<CR>
				nnoremap <silent><leader>N :BufferLineMoveNext<CR>
				nnoremap <silent><leader>P :BufferLineMovePrev<CR>
				nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
				nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
				nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
				nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
				nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
				nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
				nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
				nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
				nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
				nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
				nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
			]]
		end
	}--}}}

        use {
                'nvim-treesitter/nvim-treesitter',--{{{
                run = ':TSUpdate',
                requires = {"p00f/nvim-ts-rainbow", },
                config = function()
                        require'nvim-treesitter.configs'.setup {
                                ensure_installed = "maintained",
                                sync_install = true,
                                -- ignore_install = { "javascript" },
                                highlight = {
                                        enable = true,
                                        -- disable = { "c", "rust" },
                                },
                                indent = {
                                enable = true,
                                },
                                rainbow = {
                                        enable = true,
                                        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                                        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                                        max_file_lines = nil, -- Do not enable for files with more than n lines, int
                                        -- colors = {}, -- table of hex strings
                                        -- termcolors = {} -- table of colour name strings
                                },
                        }
                end,
        }--}}}

        use {
                "lukas-reineke/indent-blankline.nvim",--{{{
                config = function()
                        require "packages.configs.blankline"
                end,
        }--}}}}}}

        -- 面板{{{
        use {
                'kyazdani42/nvim-tree.lua',--{{{
                -- opt = true,
                -- cmd = {"NvimTreeToggle", },
                requires = {
                        {'kyazdani42/nvim-web-devicons', }, -- optional, for file icon
                },
                config = function()
                        require "packages.configs.nvim_tree"
                end
        }--}}}

	use {
		'glepnir/dashboard-nvim',
		config = function ()
			vim.cmd [[
				let g:dashboard_default_executive ='telescope'
				nmap <Leader>ss :<C-u>SessionSave<CR>
				nmap <Leader>sl :<C-u>SessionLoad<CR>
				nnoremap <silent> <Leader>dh :DashboardFindHistory<CR>
				nnoremap <silent> <Leader>df :DashboardFindFile<CR>
				nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
				nnoremap <silent> <Leader>da :DashboardFindWord<CR>
				nnoremap <silent> <Leader>dm :DashboardJumpMark<CR>
				nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
				" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
				let g:dashboard_custom_header = [
					\'',
					\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
					\'⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ',
					\'⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ',
					\'⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ',
					\'⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ',
					\'⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ',
					\'⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ',
					\'⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ',
					\'⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ',
					\'⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ',
					\'⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ',
					\'⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ',
					\'⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ',
					\'⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ',
					\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
					\]

			]]
				-- vim.g.dashboard_preview_command = 'cat'
				-- vim.g.dashboard_preview_pipeline = 'lolcat'
				-- vim.g.dashboard_preview_file = "~/.config/nvim/dashboard/cat.cat"
				-- vim.g.dashboard_preview_file_height = 12
				-- vim.g.dashboard_preview_file_width = 80
		end,
	}

        -- 诊断
        use {
                "folke/trouble.nvim",--{{{
                requires = {"kyazdani42/nvim-web-devicons",},
                opt = true,
                event = "InsertEnter",
                config = function()
                        require("trouble").setup {
                                position = "bottom", -- position of the list can be: bottom, top, left, right
                                height = 10, -- height of the trouble list when position is top or bottom
                                width = 50, -- width of the list when position is left or right
                                icons = true, -- use devicons for filenames
                                mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                                fold_open = "", -- icon used for open folds
                                fold_closed = "", -- icon used for closed folds
                                group = true, -- group results by file
                                padding = true, -- add an extra new line on top of the list
                                action_keys = { -- key mappings for actions in the trouble list
                                        -- map to {} to remove a mapping, for example:
                                        -- close = {},
                                        close = "q", -- close the list
                                        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                                        refresh = "r", -- manually refresh
                                        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                                        open_split = { "<c-x>" }, -- open buffer in new split
                                        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                                        open_tab = { "<c-t>" }, -- open buffer in new tab
                                        jump_close = {"o"}, -- jump to the diagnostic and close the list
                                        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                                        toggle_preview = "P", -- toggle auto_preview
                                        hover = "K", -- opens a small popup with the full multiline message
                                        preview = "p", -- preview the diagnostic location
                                        close_folds = {"zM", "zm"}, -- close all folds
                                        open_folds = {"zR", "zr"}, -- open all folds
                                        toggle_fold = {"zA", "za"}, -- toggle fold of current file
                                        previous = "k", -- preview item
                                        next = "j" -- next item
                                },
                                indent_lines = true, -- add an indent guide below the fold icons
                                auto_open = true, -- automatically open the list when you have diagnostics
                                auto_close = true, -- automatically close the list when you have no diagnostics
                                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                                auto_fold = false, -- automatically fold a file trouble list at creation
                                auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
                                signs = {
                                        -- icons / text used for a diagnostic
                                        error = "",
                                        warning = "",
                                        hint = "",
                                        information = "",
                                        other = "﫠"
                                },
                                use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
                        }
                end
        }--}}}

	use {
		"numToStr/FTerm.nvim",--{{{
		config = function()
			require "packages.configs.sfterm"
		end
	}--}}}

	use {
		'nvim-telescope/telescope.nvim',--{{{
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
			{"nvim-telescope/telescope-frecency.nvim"},
			{"tami5/sqlite.lua"},
			{'nvim-telescope/telescope-packer.nvim'},
		},
		config = function ()
			require('telescope').setup {
				extensions = {
					fzf = {
						fuzzy = true,                    -- false will only do exact matching
						override_generic_sorter = true,  -- override the generic sorter
						override_file_sorter = true,     -- override the file sorter
						case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
										-- the default case_mode is "smart_case"
					},
					frecency = {
						-- Path to parent directory of custom database location. Defaults to $XDG_DATA_HOME/nvim if unset.
						-- db_root = "home/my_username/path/to/db_root",
						show_scores = false,
						show_unindexed = true,
						ignore_patterns = {"*.git/*", "*/tmp/*"},
						disable_devicons = false,
						workspaces = {
							["nvim"]    = vim.fn.expand("~/.config/nvim"),
							["config"]    = vim.fn.expand("~/.config"),
							["tcpl"] = vim.fn.expand("~/learn/tcpl"),
							-- ["wiki"]    = "/home/my_username/wiki"
						}
					},
				}
			}
			require("telescope").load_extension "packer"
			require('telescope').load_extension('fzf')
			require"telescope".load_extension("frecency")
			vim.cmd[[
				nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
				nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
				nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
				nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
				nnoremap <leader>fp :Telescope packer<cr>
				" nnoremap <leader>fn <cmd>lua require('telescope').extensions.frecency()<cr>
			]]
			vim.api.nvim_set_keymap("n", "<leader>fn", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
		end
	}--}}}

	-- Lua
	use {
		"folke/which-key.nvim",--{{{
		config = function()
			require("which-key").setup {
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
					},
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					presets = {
					operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
					},
				},
				-- add operators that will trigger motion and text object completion
				-- to enable all native operators, set the preset / operators plugin above
				operators = { gc = "Comments" },
				key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
				},
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
				popup_mappings = {
					scroll_down = '<c-d>', -- binding to scroll down inside the popup
					scroll_up = '<c-u>', -- binding to scroll up inside the popup
				},
				window = {
					border = "none", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
				ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
				show_help = true, -- show help message on the command line when the popup is visible
				triggers = "auto", -- automatically setup triggers
				-- triggers = {"<leader>"} -- or specify a list manually
				triggers_blacklist = {
					-- list of mode / prefixes that should never be hooked by WhichKey
					-- this is mostly relevant for key maps that start with a native binding
					-- most people should not need to change this
					i = { "j", "k" },
					v = { "j", "k" },
				},
			}
		end
	}--}}}


--}}}

        -- 增强{{{
        use {
                'phaazon/hop.nvim',--{{{
                -- branch = 'v1.2', -- optional but strongly recommended
                -- opt = true,
                -- cmd = {"HopWord", "HopPattern", "HopChar1", "HopChar2", "HopLine", "HopLineStart"},
                config = function()
                        -- you can configure Hop the way you like here; see :h hop-config
                        require'hop'.setup {
                                keys = 'etovxqpdygfblzhckisuran'
                        }
                end,
        }--}}}

        use {
                "steelsojka/pears.nvim",--{{{
                -- opt = true,
                -- evnet = {"InsertEnter", "VimEnter", },
                config = function()
                        require "pears".setup()
                end,
        }--}}}

        use {
                'numToStr/Comment.nvim',--{{{
                opt = true,
                event = "BufWinEnter",
                config = function()
                        require('Comment').setup{
                                ---Add a space b/w comment and the line
                                ---@type boolean
                                padding = true,
                                ---Whether the cursor should stay at its position
                                ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
                                ---@type boolean
                                sticky = true,
                                ---Lines to be ignored while comment/uncomment.
                                ---Could be a regex string or a function that returns a regex string.
                                ---Example: Use '^$' to ignore empty lines
                                ---@type string|fun():string
                                ignore = nil,
                                ---LHS of toggle mappings in NORMAL + VISUAL mode
                                ---@type table
                                toggler = {
                                        ---Line-comment toggle keymap
                                        line = 'gcc',
                                        ---Block-comment toggle keymap
                                        block = 'gbc',
                                },
                                ---LHS of operator-pending mappings in NORMAL + VISUAL mode
                                ---@type table
                                opleader = {
                                        ---Line-comment keymap
                                        line = 'gc',
                                        ---Block-comment keymap
                                        block = 'gb',
                                },
                                ---LHS of extra mappings
                                ---@type table
                                extra = {
                                        ---Add comment on the line above
                                        above = 'gcO',
                                        ---Add comment on the line below
                                        below = 'gco',
                                        ---Add comment at the end of line
                                        eol = 'gcA',
                                },
                                ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
                                ---@type table
                                mappings = {
                                        ---Operator-pending mapping
                                        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
                                        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
                                        basic = true,
                                        ---Extra mapping
                                        ---Includes `gco`, `gcO`, `gcA`
                                        extra = true,
                                        ---Extended mapping
                                        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
                                        extended = true,
                                },
                                ---Pre-hook, called before commenting the line
                                --[[ ---@type fun(ctx: Ctx):string
                                pre_hook = nil,
                                ---Post-hook, called after commenting is done
                                ---@type fun(ctx: Ctx)
                                post_hook = nil, ]]
                        }
                end
        }--}}}

	-- use {
	-- 	"tpope/vim-repeat.git",--{{{
	-- 	config = function ()
	-- 		vim.cmd[[
	-- 			silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
	-- 		]]
	-- 	end,
	-- }--}}}

	-- }}}

        -- 其它{{{
        use {
                'michaelb/sniprun',--{{{
                run = 'bash ./install.sh',
                requires = {{'rcarriga/nvim-notify'}},
                config = function ()
                        require'sniprun'.setup({
                                selected_interpreters = {},     --# use those instead of the default for the current filetype
                                repl_enable = {},               --# enable REPL-like behavior for the given interpreters
                                repl_disable = {},              --# disable REPL-like behavior for the given interpreters
                                interpreter_options = {         --# intepreter-specific options, see docs / :SnipInfo <name>
                                        GFM_original = {
                                                use_on_filetypes = {"markdown.pandoc"}    --# the 'use_on_filetypes' configuration key is
                                        }
                                },
                                --# you can combo different display modes as desired
                                display = {
                                -- "Classic",                    --# display results in the command-line  area
                                "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
                                "VirtualTextErr",          --# display error results as virtual text
                                -- "TempFloatingWindow",      --# display results in a floating window
                                -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
                                -- "Terminal",                --# display results in a vertical split
                                -- "TerminalWithCode",        --# display results and code history in a vertical split
                                "NvimNotify",              --# display with the nvim-notify plugin
                                -- "Api"                      --# return output to a programming interface
                                },
                                display_options = {
                                terminal_width = 45,       --# change the terminal display option width
                                notification_timeout = 500   --# timeout for nvim_notify output
                                },
                                show_no_output = {
                                -- "Classic",
                                "NvimNotify",              --# display with the nvim-notify plugin
                                -- "TempFloatingWindow",      --# implies LongTempFloatingWindow, which has no effect on its own
                                },
                                -- snipruncolors = {
                                --         SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
                                --         SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
                                --         SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
                                --         SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
                                -- },
                                inline_messages = 0,             --# inline_message (0/1) is a one-line way to display messages
                                borders = 'single',               --# display borders around floating windows
                                live_mode_toggle='off',       --# live mode toggle, see Usage - Running for more info
                        })
                        vim.api.nvim_set_keymap('v', '<leader>r', '<Plug>SnipRun', {silent = true})
                        vim.api.nvim_set_keymap('n', '<leader>r', '<Plug>SnipRunOperator', {silent = true})
                        vim.api.nvim_set_keymap('n', '<leader>rr', '<Plug>SnipRun', {silent = true})
                end
        }--}}}

        use {
                'nvim-lua/plenary.nvim',--{{{
                -- opt = true,
                -- event = "VimEnter",
        }--}}}

        use {
                'rcarriga/nvim-notify',--{{{
                opt = true,
                event = "BufWinEnter",
                config = function()
                        require "packages.configs.snotify"
                end

        }--}}}

	use {
		'nvim-orgmode/orgmode',--{{{
		config = function()
			require"packages.configs.sorgmode"
		end,
	}--}}}

	use {
		"akinsho/org-bullets.nvim",--{{{
		config = function()
			require("org-bullets").setup {
				-- symbols = { "◉", "○", "✸", "✿" }
				-- or a function that receives the defaults and returns a list
				symbols = function(default_list)
					table.insert(default_list, "♥")
				return default_list
			end}
		end
	}--}}}

	use {
		'lukas-reineke/headlines.nvim',--{{{
		config = function()
			require("headlines").setup {
				markdown = {
					source_pattern_start = "^```",
					source_pattern_end = "^```$",
					dash_pattern = "^---+$",
					headline_pattern = "^#+",
					headline_highlights = { "Headline" },
					codeblock_highlight = "CodeBlock",
					dash_highlight = "Dash",
					fat_headlines = true,
				},
				rmd = {
					source_pattern_start = "^```",
					source_pattern_end = "^```$",
					dash_pattern = "^---+$",
					headline_pattern = "^#+",
					headline_signs = { "Headline" },
					codeblock_sign = "CodeBlock",
					dash_highlight = "Dash",
					fat_headlines = true,
				},
				vimwiki = {
					source_pattern_start = "^{{{%a+",
					source_pattern_end = "^}}}$",
					dash_pattern = "^---+$",
					headline_pattern = "^=+",
					headline_highlights = { "Headline" },
					codeblock_highlight = "CodeBlock",
					dash_highlight = "Dash",
					fat_headlines = true,
				},
				org = {
					source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
					source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
					dash_pattern = "^-----+$",
					headline_pattern = "^%*+",
					headline_highlights = { "Headline" },
					codeblock_highlight = "CodeBlock",
					dash_highlight = "Dash",
					fat_headlines = true,
				},
			}
		end,
	}--}}}

	use {
		'dhruvasagar/vim-table-mode',--{{{
	}--}}}

	use {
		'jubnzv/mdeval.nvim',--{{{
		config = function()
			require 'mdeval'.setup({
				require_confirmation=false,
				eval_options = {
					c = {
						command = {"gcc", "-std=c89", "-O0", "-Wall", "-Werror", "-pedantic"},
						default_header = [[
						#include <stdio.h>
						#include <stdlib.h>
						]],
					},
					-- cpp = {
					-- command = {"clang++", "-std=c++20", "-O0"},
					-- default_header = [[
					-- #include <iostream>
					-- #include <vector>
					-- using namespace std;
					-- ]]
					-- },
					-- -- Add new configuration for Racket
					-- racket = {
					-- command = {"racket"},        -- Command to run interpreter
					-- language_code = "racket",    -- Markdown language code
					-- exec_type = "interpreted",   -- compiled or interpreted
					-- extension = "rkt",           -- File extension for temporary files
					-- },
				},
			})
		end,
	}--}}}

--}}}

    ----------------------------------------------------------------------
    -- 首次安装之后自动同步{{{
    if packer_bootstrap then
        require('packer').sync()
    end
end) --}}}
----λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
