local interface = {}

function interface.setup()
  -- color palette
  local colors = {
    black = '#1F2335',
    red = '#F07178',
    blue = '#82AAFF',
    green = '#6FFF68',
    lightgreen = '#DAFDBA',
    yellow = '#F2C12E',
    lightyellow = '#FFFFBA',
    purple = '#b392f0',
    lightpurple = '#ccccff',
    darkgray = '#3D3D3D',
    lightgray = '#504945',
    white = '#d9d9d9',
    none = 'none',
  }

  -- barbar
  require('barbar').setup({
    animation = false,
    auto_hide = false,
    focus_on_close = 'left',
  })

  -- colorizer
  require('colorizer').setup(nil, {
    RRGGBBAA = true,
    css = true,
    css_fn = true,
    rgb_fn = true,
    hsl_fn = true,
  })

  -- gitsigns
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  })
  require('nvim-web-devicons').setup({ default = true })

  -- statusline
  require('lualine').setup({ options = { theme = 'iceberg_dark' } })

  -- theme specific mod

  -- activate theme
  vim.cmd('colorscheme github_dark')

  -- custom mod
  require('github-theme').setup({ transparent = true })
  -- general
  vim.cmd('hi Normal guibg=none') -- enable transparent background
  -- vim.cmd(string.format("hi CursorLineNr guifg=%s guibg=none gui=bold", colors.lightpurle))
  -- vim.cmd(string.format("hi CursorLine guibg=%s", colors.black))
  vim.cmd(string.format('hi PmenuSel guibg=%s guifg=%s gui=bold', colors.lightpurple, colors.black))
  vim.cmd(string.format('hi PmenuSbar guibg=%s guifg=%s', colors.lightpurle, colors.black))
  vim.cmd(string.format('hi LineNr guifg=%s guibg=none', colors.darkgray))
  vim.cmd(string.format('hi TelescopeBorder guifg=%s guibg=none', colors.darkgray))
  vim.cmd(string.format('hi FloatBorder guifg=%s guibg=none', colors.darkgray))
  vim.cmd(string.format('hi LazygitBorder guifg=%s guibg=none', colors.darkgray))
  vim.cmd(string.format('hi BufferCurrent guibg=colors.darkgray', colors.lightpurple))
  -- diagnostic
  vim.cmd('hi DiagnosticSignWarn guibg=none')
  vim.cmd('hi DiagnosticSignError guibg=none')
  vim.cmd('hi DiagnosticSignInfo guibg=none')
  vim.cmd('hi DiagnosticSignHint guibg=none')
  vim.cmd('hi DiagnosticWarn guibg=none')
  vim.cmd('hi DiagnosticError guibg=none')
  vim.cmd('hi DiagnosticInfo guibg=none')
  vim.cmd('hi DiagnosticHint guibg=none')
  -- gitsigns
  vim.cmd('hi SignColumn guibg=none')
  vim.cmd(string.format('hi DiffAdd guifg=%s guibg=none gui=bold', colors.green))
  vim.cmd(string.format('hi DiffChange guifg=%s guibg=none gui=bold', colors.yellow))
  vim.cmd(string.format('hi DiffDelete guifg=%s guibg=none gui=bold', colors.red))

  -- modificator (cursorLineNr mod)
  require('modicator').setup({
    highlights = {
      defaults = {
        foreground = '#d9d9d9',
        background = 'none',
        bold = true,
        italic = false,
      },
      modes = {
        ['n'] = {
          foreground = '#d9d9d9',
        },
        ['i'] = {
          foreground = '#82aaff',
        },
        ['v'] = {
          foreground = '#b392f0',
        },
        ['V'] = {
          foreground = '#b392f0',
        },
        [''] = {
          foreground = '#b392f0',
        },
      },
    },
  })

  -- cursor-word
  vim.cmd('hi default CursorWord cterm=underline gui=bold')
end

return interface
