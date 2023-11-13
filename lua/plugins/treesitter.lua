return {
    {
        "nvim-treesitter/nvim-treesitter", -- 语法高亮插件
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/playground",
        },
        main = "nvim-treesitter.configs",
        build = ":TSUpdate", -- 每次插件设置更改后，都会运行build这个命令来更新配置
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = "all", -- 安装需要支持的语言类型
                sync_install = false, -- 安装支持语言的解析器

                highlight = { -- 高亮显示
                    enable = true -- 全部开启
                },

                indent = {
                    enable = true
                },  
            })
        end
    },
}
