local M = {}

local nvim_treesitter_configs = require("nvim-treesitter.configs")

function M.setup()
  nvim_treesitter_configs.setup(
    {
      ensure_installed = "all",
      ignore_install = {"swift", "phpdoc", "beancount"},
      autopairs = {enable = true},
      highlight = {enable = true},
      indent = {enable = true},
      rainbow = {enable = true, extended_mode = true},
      context_commentstring = {enable = true},
      textobjects = {
        select = {
          enable = true,
          lookahead = true
        }
      }
    }
  )
  -- spellsitter
  require("spellsitter").setup(
    {
      -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
      enable = true
    }
  )
end

return M
