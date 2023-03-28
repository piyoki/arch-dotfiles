local M = {}

local formatter = require("formatter")

function M.setup()
  formatter.setup(
    {
      filetype = {
        -- markdown formatter
        markdown = {
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
              stdin = true
            }
          end
        },
        -- json formatter
        json = {
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
              stdin = true
            }
          end
        },
        conf = {
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
              stdin = true
            }
          end
        },
        -- hcl formatter
        hcl = {
          function()
            return {
              exec = "terragrunt",
              args = {"hclfmt"},
              stdin = false
            }
          end
        },
        -- terraform formatter
        terraform = {
          function()
            return {
              exe = "terraform",
              args = {"fmt", "-"},
              stdin = true
            }
          end
        },
        -- golang formatter
        go = {
          function()
            return {
              exe = "gofmt",
              args = {"-w"},
              stdin = false
            }
          end
        },
        -- lua formatter
        lua = {
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        -- shell script formatter
        sh = {
          function()
            return {
              exe = "shfmt",
              args = {"-i", 2},
              stdin = true
            }
          end
        },
        -- nodejs formatter
        javascript = {
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
              stdin = true
            }
          end
        },
        -- python formatter
        python = {
          function()
            return {
              exe = "python3 -m autopep8",
              args = {
                "--in-place --aggressive --aggressive",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
              },
              stdin = false
            }
          end
        },
        -- ruby formatter
        ruby = {
          function()
            return {
              exe = "rubocop", -- might prepend `bundle exec `
              args = {"--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'"},
              stdin = true
            }
          end
        }
      }
    }
  )
end

return M
