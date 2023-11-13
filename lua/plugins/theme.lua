return {
    {
        "folke/tokyonight.nvim",
        -- 安装依赖项
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        -- 插件配置
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]]
            require('lualine').setup({
                options = {
                    theme = "tokyonight"
                },
            })
            require('barbecue').setup({
                theme = 'tokyonight',
            })
        end
    },
}
