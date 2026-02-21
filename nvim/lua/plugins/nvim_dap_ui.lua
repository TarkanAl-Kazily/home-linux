-- Debug adapter ui that works with nvim-dap

return {
    'rcarriga/nvim-dap-ui',
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    opts = {
        layouts = { {
            elements = { {
                id = "scopes",
                size = 0.25
              }, {
                id = "breakpoints",
                size = 0.25
              }, {
                id = "stacks",
                size = 0.25
              }, {
                id = "watches",
                size = 0.25
              } },
            position = "left",
            size = 40
          }, {
            elements = { {
                id = "repl",
                size = 1.0
              }
            },
            position = "bottom",
            size = 40
          } },
    },
    config = function(LazyPlugin, opts)
        require("lazydev").setup({
          library = { "nvim-dap-ui" },
        })

        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.before.attach.dapui_config = function()
          dapui.open({reset = true})
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open({reset = true})
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        vim.keymap.set('n', '<leader>gg', ':lua require("dapui").toggle({reset = true})<CR>', { noremap = true })
    end,
}
