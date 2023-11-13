

-- 键盘映射 --
-- 使用LspAttach自动命令仅映射以下关键点
-- 语言服务器连接到当前缓冲区之后
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        local nmap = function(keys, func, desc) -- 定义键盘设置函数, 快速设置desc
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
        end

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
        nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
        nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
        nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
        nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap("<space>f", function()
            vim.lsp.buf.format { async = true }
        end, "[F]ormat code")
    end,
})
-- 键盘映射 --

