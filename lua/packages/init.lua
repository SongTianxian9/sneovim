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

        -- UI{{{
        use {
                "monsonjeremy/onedark.nvim",--{{{
                config = function()
                        require('onedark').setup({
                                functionStyle = "italic",
                                -- variableStyle = "italic",
                                hideInactiveStatusline = true,
                                -- sidebars = {"qf", "vista_kind", "terminal", "packer"},
                                -- colors = {hint = "orange", error = "#ff0000"}
                                customTelescope = true,
                        })
                end,
        }--}}}

        -- use {
        --         'navarasu/onedark.nvim',--{{{
        --         config = function()
        --                 require('onedark').setup  {
        --                         -- Main options --
        --                         style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        --                         transparent = false,  -- Show/hide background
        --                         term_colors = true, -- Change terminal color as per the selected theme style
        --                         ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        --                         -- toggle theme style ---
        --                         toggle_style_key = '<leader>ts', -- Default keybinding to toggle
        --                         toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
        --
        --                         -- Change code style ---
        --                         -- Options are italic, bold, underline, none
        --                         -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
        --                         code_style = {
        --                                 comments = 'italic,bold',
        --                                 keywords = 'bold',
        --                                 functions = 'bold,italic,undercurl',
        --                                 strings = 'italic',
        --                                 variables = 'bold,italic'
        --                         },
        --
        --                         -- Custom Highlights --
        --                         colors = {}, -- Override default colors
        --                         highlights = {
        --                                 -- IndentBlanklineIndent1 = {guibg = "#1f1f1f", gui = "nocombine", },
        --                                 -- IndentBlanklineIndent2 = {guibg = "#1a1a1a", gui = "nocombine", },
        --                         }, -- Override highlight groups
        --
        --                         -- Plugins Config --
        --                         diagnostics = {
        --                                 darker = false, -- darker colors for diagnostic
        --                                 undercurl = true,   -- use undercurl instead of underline for diagnostics
        --                                 background = false,    -- use background color for virtual text
        --                         },
        --                 }
        --                 require('onedark').load()
        --         end,
        -- }--}}}

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

        use {
                'bagrat/vim-buffet',--{{{
                config = function()
                        require"packages.configs.buffet"
                end,
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
                opt = true,
                cmd = {"NvimTreeToggle", },
                requires = {
                        {'kyazdani42/nvim-web-devicons', }, -- optional, for file icon
                },
                config = function()
                        require "packages.configs.nvim_tree"
                end
        }--}}}

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
                'rcarriga/nvim-notify',--{{{
                -- requires = {{'nvim-lua/plenary.nvim'},},
                config = function()
                        require "packages.configs.snotify"
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
                                ---@type fun(ctx: Ctx):string
                                pre_hook = nil,
                                ---Post-hook, called after commenting is done
                                ---@type fun(ctx: Ctx)
                                post_hook = nil,
                        }
                end
        }--}}}}}}

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
                        require 'packages.configs.lspconfig'
                end,
        }

        --}}}
        --
        use {
                'williamboman/nvim-lsp-installer',
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
        }

        -- }}}

    ----------------------------------------------------------------------
    -- 首次安装之后自动同步{{{
    -- if packer_bootstrap then
    --     require('packer').sync()
    -- end
end) --}}}
----λλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλλ
