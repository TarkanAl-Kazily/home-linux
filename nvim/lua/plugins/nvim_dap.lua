-------------------------------------------------------------------------------
-- LLDB Debug Adapter configuration
-- Docs:
--   https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#c-c-rust-via-lldb-vscode
-- :help dap.txt
-- :help dap-mapping
-- :help dap-api
-------------------------------------------------------------------------------
return {
    'mfussenegger/nvim-dap',
    opts = {
    },
    config = function(LazyPlugin, opts)
        local dap = require('dap')
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        dap.adapters.lldb = {
          type = 'executable',
          command = '/usr/bin/lldb-vscode-17',
          name = 'lldb'
        }

        dap.configurations.cpp = {
          {
            name = 'Launch by path',
            type = 'lldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            stopOnEntry = false,
            args = {},

            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
          },
          {
            name = 'Launch an executable',
            type = 'lldb',
            request = 'launch',
            program = function()
                return coroutine.create(function(coro)
                    local opts = {}
                    pickers
                    .new(opts, {
                        prompt_title = "Path to executable",
                        finder = finders.new_oneshot_job({ "find", ".", "-executable", "-type", "f"}, {}),
                        sorter = conf.generic_sorter(opts),
                        attach_mappings = function(buffer_number)
                            actions.select_default:replace(function()
                                actions.close(buffer_number)
                                coroutine.resume(coro, action_state.get_selected_entry()[1])
                            end)
                            return true
                        end,
                    })
                    :find()
                end)
            end,
            stopOnEntry = false,
            args = {},

            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
          },
        }

        dap.configurations.c = dap.configurations.cpp

        -- custom keymappings
        vim.keymap.set('n', '<leader>gc', function() require('dap').continue() end)
        vim.keymap.set('n', '<leader>o', function() require('dap').step_over() end)
        vim.keymap.set('n', '<leader>i', function() require('dap').step_into() end)
        vim.keymap.set('n', '<leader>u', function() require('dap').step_out() end)
        vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
        vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<leader>gl', function() require('dap').run_last() end)

        dap.set_log_level('TRACE')
    end
}
