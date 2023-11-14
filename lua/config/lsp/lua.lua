local capabilities = require('cmp_nvim_lsp').default_capabilities() -- 连接自动补全

-- 将语言服务器连接到缓冲区
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    capabilities = capabilities,
})

-- 在行列中显示的符号
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 导入键盘映射 --
require("config.keymaps")
-- 导入键盘映射 --
