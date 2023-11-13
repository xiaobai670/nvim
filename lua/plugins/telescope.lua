return {
    {
        "nvim-telescope/telescope.nvim", -- 模糊查询插件
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim", 
                build = "make",
            },
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {
                    fuzzy = true,                    -- false只能进行精确匹配
                    override_generic_sorter = true,  -- 覆盖通用分拣机
                    override_file_sorter = true,     -- 覆盖文件分类器
                    case_mode = "smart_case",        -- 忽略大小写或精确大小写
                                                   -- 默认是精确大小写
                }
              }
            }
            require('telescope').load_extension('fzf')

            -- 快捷键设置
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
}
