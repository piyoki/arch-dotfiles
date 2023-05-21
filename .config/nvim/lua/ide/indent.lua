local M = {}

local indent = require("indent_blankline")

function M.setup()
	vim.api.nvim_command([[
    set listchars=tab:\|\ ,trail:▫
  ]])
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")

	indent.setup({
		-- for example, context is off by default, use this to turn it on
		show_current_context = true,
		show_current_context_start = true,
		space_char_blankline = " ",
		show_end_of_line = true,
	})
end

return M
