local interface = {}

function interface.shade_setup()
end

function interface.barbar_setup()
  -- barbar
  vim.g.bufferline = {
    animation = false,
    auto_hide = true,
    icons = true
  }
end

function interface.setup()
  -- twilight
  require("twilight").setup(
    {
      dimming = {
        alpha = 0.25, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = {"Normal", "#ffffff"},
        inactive = false -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 15, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = {
        -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement"
      },
      exclude = {} -- exclude these filetypes
    }
  )

  -- colorizer
  require("colorizer").setup(
    nil,
    {
      RRGGBBAA = true,
      css = true,
      css_fn = true,
      rgb_fn = true,
      hsl_fn = true
    }
  )

  -- gitsigns
  require("gitsigns").setup(
    {
      signs = {
        add = {hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
        change = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
        delete = {hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"}
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false -- Toggle with `:Gitsigns toggle_word_diff`
    }
  )
  require("nvim-web-devicons").setup({default = true})

  -- color palette
  local colors = {
    black = "#282828",
    black_2 = "#1F2335",
    red = "#F07178",
    blue = "#82AAFF",
    green = "#6FFF68",
    lightgreen = "#DAFDBA",
    yellow = "#F2C12E",
    lightyellow = "#FFFFBA",
    purple = "#b392f0",
    lightpurple = "#ccccff",
    darkgray = "#3D3D3D",
    lightgray = "#504945",
    none = "none"
  }

  -- statusline
  require("lualine").setup {options = {theme = "iceberg_dark"}}

  -- colorscheme
  require("utils").opt("o", "termguicolors", true)

  -- theme specific mod

  -- activate theme
  -- vim.cmd("colorscheme github-colors")
  vim.cmd("colorscheme github_dark")

  -- custom mod
  require("github-theme").setup({transparent = true})
  -- general
  -- vim.cmd("hi Normal guibg=none") -- enable transparent background
  vim.cmd(string.format("hi PmenuSel guibg=%s guifg=%s gui=bold", colors.lightpurple, colors.black_2))
  vim.cmd(string.format("hi PmenuSbar guibg=%s guifg=%s", colors.lightpurle, colors.black_2))
  vim.cmd(string.format("hi CursorLineNr guifg=%s guibg=none gui=bold", colors.lightpurle))
  vim.cmd(string.format("hi CursorLine guibg=%s", colors.black))
  vim.cmd(string.format("hi LineNr guifg=%s guibg=none", colors.darkgray))
  -- diagnostic
  vim.cmd("hi DiagnosticSignWarn guibg=none")
  vim.cmd("hi DiagnosticSignError guibg=none")
  vim.cmd("hi DiagnosticSignInfo guibg=none")
  vim.cmd("hi DiagnosticSignHint guibg=none")
  vim.cmd("hi DiagnosticWarn guibg=none")
  vim.cmd("hi DiagnosticError guibg=none")
  vim.cmd("hi DiagnosticInfo guibg=none")
  vim.cmd("hi DiagnosticHint guibg=none")
  -- gitsigns
  vim.cmd("hi SignColumn guibg=none")
  vim.cmd(string.format("hi DiffAdd guifg=%s guibg=none gui=bold", colors.green))
  vim.cmd(string.format("hi DiffChange guifg=%s guibg=none gui=bold", colors.yellow))
  vim.cmd(string.format("hi DiffDelete guifg=%s guibg=none gui=bold", colors.red))
end

return interface
