require("notify").setup({
        -- Animation style (see below for details)
        stages = "slide",
        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,
        -- Function called when a window is closed
        on_close = nil,
        -- Render function for notifications. See notify-render()
        render = "default",
        -- Default timeout for notifications
        timeout = 20000,
        -- Max number of columns for messages
        max_width = nil,
        -- Max number of lines for a message
        max_height = nil,
        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
        background_colour = "Normal",

        -- Minimum width for notification windows
        minimum_width = 50,

        -- Icons for the different levels
        icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
        },
})

vim.notify = require("notify")

local async = require("plenary.async")
local notify = require("notify").async

async.run(function()
        if #vim.lsp.buf_get_clients(0) > 0 then
                notify("Lsp 已正常加载", "info", {title = "Lsp 状态：", timeout = 3000}).close()
        else
                notify("Lsp 没能加载, 快去看下哪有问题", "warn", {title = "Lsp 状态：", timeout = 6000}).close()
        end
        notify("\t\t快乐学习，你能行！！！\n\t\t加油宋天祥！！！", "info", {title = "With great power comes great responsibility",})
end)
