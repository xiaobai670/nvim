return {
    {
        "neovim/nvim-lspconfig", -- neovim的lspconfig插件，可以连接自动补全插件，连接前请确定已安装自动补全插件
        cmd = {"Mason"},
        event = {"BufReadPost", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim", -- LSP管理插件
            "williamboman/mason-lspconfig", -- 桥接mason和lspconfig的插件, 可以在该插件进行lspconfig插件的配置
            "nvimdev/lspsaga.nvim", -- LSP UI增强插件
            {
                "j-hui/fidget.nvim", -- lsp加载管理插件
                tag = "legacy",
                event = "LspAttach",
            },
            "folke/neodev.nvim", -- 提供neovim完整的API帮助

        },
        config = function()
            -- 定义局部变量, 如默认语言服务和lsp自动补全
            local servers = { -- 默认的语言服务器
                lua_ls = {},
                rust_analyzer = {},
                clangd = {},
                pyright = {},
                jsonls = {},
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities() -- 连接自动补全

            -- 插件配置 --
            require("fidget").setup()
            require("lspsaga").setup()
            require("neodev").setup()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers), -- 函数作用: vim.tbl_keys({}) : 返回表中使用的所有键的列表。但是，不能保证键的返回表的顺序。
                handlers = {
                    function(server_name) -- 默认处理程序

                        -- 将语言服务器连接到缓冲区
                        require("lspconfig")[server_name].setup {
                            settings = servers[server_name],
                            capabilities = capabilities,
                        }

                        -- 在行列中显示的符号
                        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                        for type, icon in pairs(signs) do
                            local hl = "DiagnosticSign" .. type
                            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                        end

                        -- 导入键盘映射
                        require("config.lsp.lsp_keymaps")
                        -- 导入键盘映射

                    end,
                }
            })

            -- 插件配置 --

        end
    },
}
