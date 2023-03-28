local M = {}

function M.setup()
  require("ide.treesitter").setup()
  require("ide.lsp").setup()
  require("ide.cmp").setup()
  require("ide.formatter").setup()
  require("ide.indent").setup()
end

return M
