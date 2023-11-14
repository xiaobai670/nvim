return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { '<F5>',      function() require 'telescope'.extensions.dap.configurations {} end },
            { '<F10>',     function() require('dap').step_over() end },
            { '<F11>',     function() require('dap').step_into() end },
            { '<F12>',     function() require('dap').step_out() end },
            { '<Leader>b', function() require('dap').toggle_breakpoint() end },
            { '<Leader>B', function() require('dap').set_breakpoint() end },
            { '<Leader>lp',
                function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
            { '<Leader>dr', function() require('dap').repl.open() end },
            { '<Leader>dl', function() require('dap').run_last() end },
            {
                '<Leader>dh',
                function()
                    require('dap.ui.widgets').hover()
                end,
                mode = { 'n', 'v' }
            },
            {
                '<Leader>dp',
                function()
                    require('dap.ui.widgets').preview()
                end,
                mode = { 'n', 'v' }
            },
            { '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end },
            { '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            require("nvim-dap-virtual-text").setup()
            require("dapui").setup()

            -- 断点, 运行图标设置

            local dap_breakpoint_color = {
                breakpoint = {
                    ctermbg=0,
                    fg='#993939',
                    bg='#31353f',
                },
                logpoing = {
                    ctermbg=0,
                    fg='#61afef',
                    bg='#31353f',
                },
                stopped = {
                    ctermbg=0,
                    fg='#98c379',
                    bg='#31353f'
                },
            }

            vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
            vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
            vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

            local dap_breakpoint = {
                error = {
                    text = "",
                    texthl = "DapBreakpoint",
                    linehl = "DapBreakpoint",
                    numhl = "DapBreakpoint",
                },
                condition = {
                    text = '',
                    texthl = 'DapBreakpoint',
                    linehl = 'DapBreakpoint',
                    numhl = 'DapBreakpoint',
                },
                rejected = {
                    text = "",
                    texthl = "DapBreakpoint",
                    linehl = "DapBreakpoint",
                    numhl = "DapBreakpoint",
                },
                logpoint = {
                    text = '',
                    texthl = 'DapLogPoint',
                    linehl = 'DapLogPoint',
                    numhl = 'DapLogPoint',
                },
                stopped = {
                    text = '',
                    texthl = 'DapStopped',
                    linehl = 'DapStopped',
                    numhl = 'DapStopped',
                },
            }

            vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
            vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
            vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
            vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
            vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
            -- 

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
}
