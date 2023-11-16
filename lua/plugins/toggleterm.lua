return {
    {
        "akinsho/toggleterm.nvim",
        config = function ()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]], -- 打开和关闭终端的快捷键
                start_in_insert = true,
                direction = 'float',
            })

            function _G.set_terminal_keymaps() -- 设置可以在打开的终端中移动和切换模式的快捷键
                local opts = {buffer = 0}
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
            vim.cmd [[let &shell = '"D:/Program/Git/bin/bash.exe"']] -- 将使用的终端切换为Git-Bash
            vim.cmd [[let &shellcmdflag = '-s']]
        end
    },
}
