return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- 并非严格要求，但建议
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- 可选 预览窗口中的图像支持: 有关详细信息，请参阅“#预览模式”
        },
        config = function ()
            require("neo-tree").setup()
            vim.keymap.set({"n", "v"}, "<leader>e", [[<cmd>Neotree toggle<CR>]]) -- 设置快捷键，将主键加e设置为打开文档树
        end
    },
}
