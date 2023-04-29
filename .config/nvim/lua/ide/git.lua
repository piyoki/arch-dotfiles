local M = {}

function M.setup()
  -- local utils = require("utils")
  -- utils.opt("o", "gitblame_date_format", "%r")
  vim.g.gitblame_date_format = "%r"
end

return M
