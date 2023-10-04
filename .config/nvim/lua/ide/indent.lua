local M = {}

local highlight = {
  'RainbowViolet',
  'RainbowBlue',
  'RainbowLightYellow',
  'RainbowLightBlue',
  'WhiteSpace',
}

local hooks = require('ibl.hooks')

function M.setup()
  -- vim.api.nvim_command([[
  --   set listchars=tab:\|\ ,trail:▫
  -- ]])
  -- vim.opt.list = true
  -- vim.opt.listchars:append('trail:▫')
  -- vim.opt.listchars:append('eol:↴')

  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#ccccff' })
    vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61afef' })
    vim.api.nvim_set_hl(0, 'RainbowLightYellow', { fg = '#dafdba' })
    vim.api.nvim_set_hl(0, 'RainbowLightBlue', { fg = '#dffbfc' })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }
  require('ibl').setup({
    scope = { highlight = highlight },
    whitespace = {
      remove_blankline_trail = true,
    },
  })

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
