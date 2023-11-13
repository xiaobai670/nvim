return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function()
            require("bufferline").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("ibl").setup()
        end
    },
    {
        "goolord/alpha-nvim",
        dependencies = { 
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            -- require"alpha".setup(require"alpha.themes.dashboard".config)
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'
            dashboard.section.header.val = {
                [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
                [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
                [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
                [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
                [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
                [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
            }
            dashboard.section.buttons.val = {
                dashboard.button( "e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  Find file", "<cmd> Telescope find_files <cr>"),
                dashboard.button("r", "  Recent files", "<cmd> Telescope oldfiles <cr>"),
                dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
            }
            local handle = io.popen('fortune')
            local fortune = handle:read("*a")
            handle:close()
            dashboard.section.footer.val = fortune

            dashboard.config.opts.noautocmd = true

            vim.cmd[[autocmd User AlphaReady echo 'ready']]

            alpha.setup(dashboard.config)

        end
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    },
}
