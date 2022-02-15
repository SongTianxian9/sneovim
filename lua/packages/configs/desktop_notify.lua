
-- Overrides vim.notify
require("desktop-notify").override_vim_notify()

-- Or, plugin authors/users can use it to send desktop notifications for
-- background tasks. The function works the same way as vim.notify.
notify = require("desktop-notify").notify()

if #vim.lsp.buf_get_clients > 0 then
        notify("Lsp 已正常加载， 很不错")
else
        notify("Lsp 没能正常加载，快去看下咋回事！！")
end
