local capabilities = require('cmp_nvim_lsp').default_capabilities() -- 连接自动补全

-- 将语言服务器连接到缓冲区
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
    capabilities = capabilities,
})

-- 导入键盘映射 --
require("config.keymaps")
-- 导入键盘映射 --
