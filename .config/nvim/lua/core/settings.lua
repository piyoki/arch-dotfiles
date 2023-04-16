local settings = {}
-- `utils`                  --> Module required or at the beginning of the import file
-- `vim.cmd`                --> Used to execute Vim commands
-- `vim.api.nvim_command`   --> Used to execute NeoVim commands
-- `utils.opt`              --> Helper functions are used to set various Vim options in global, buffer, and window scope.

function settings.setup()
  local utils = require("utils")
  local cmd = vim.cmd
  local indent = 2 -- set indent number

  cmd("syntax on") -- enable sytnax highlighting
  cmd("filetype plugin indent on")

  -- buffer options
  utils.opt("b", "expandtab", true) -- convert tabs to spaces
  utils.opt("b", "tabstop", indent) -- insert the number of spaces for a tab
  utils.opt("b", "shiftwidth", indent) -- change the number of space characters inserted for indentation
  utils.opt("b", "softtabstop", indent) -- set the number of columns for a TAB
  utils.opt("b", "smartindent", true)
  utils.opt("b", "spelllang", "en_us") -- set spell check languages

  -- global options
  utils.opt("o", "showtabline", indent) -- always show tabline
  utils.opt("o", "autochdir", true) -- change the current working directory whenever opening a file
  utils.opt("o", "autoindent", true) -- enable auto indent
  utils.opt("o", "wrap", true) -- wrap text
  utils.opt("o", "signcolumn", "yes") -- always show the signcolumn, or it would shift the text each time
  -- utils.opt("o", "hidden", true) -- when off a buffer is unloaded when it is abandoned
  utils.opt("o", "scrolloff", indent) -- minimal number of screen lines to keep above and below the cursor
  utils.opt("o", "shiftround", true) -- round indent to multiple of 'shiftwidth', apply to >, <
  utils.opt("o", "smartcase", true) -- enable smarcase
  utils.opt("o", "smarttab", true) -- enable smarttab
  utils.opt("o", "smartindent", true) -- enable smartindent
  utils.opt("o", "termguicolors", true) -- enable termguicolors
  utils.opt("o", "splitbelow", true) -- horizontal splits will automatically be below
  utils.opt("o", "splitright", true) -- vertical splits will automatically be below
  utils.opt("o", "ruler", true) -- show the cursor position all the time
  utils.opt("o", "updatetime", 100) -- faster completion
  utils.opt("o", "timeoutlen", 300) -- time in milliseconds to wait for a mapped sequence to complete
  utils.opt("o", "cmdheight", 1) -- more space for displaying messages, default 1
  utils.opt("o", "completeopt", "menuone,noselect") -- a comma separated list of options for Insert mode completion

  -- window scope options
  utils.opt("w", "number", true)
  utils.opt("w", "relativenumber", true) -- enable relative linenumber
  utils.opt("w", "cursorline", true) -- enable highlighting of the current line
  utils.opt("w", "foldmethod", "indent") -- The kind of folding used for the current window.
  utils.opt("w", "foldlevel", 99) -- the foldlevel of line
  utils.opt("w", "foldenable", false) -- disable open all fold
  utils.opt("w", "fillchars", "eob: ") -- characters to fill the statuslines and vertical separators. eob: ~
  utils.opt("w", "spell", true) -- set spell check

  -- Searching
  utils.opt("o", "hlsearch", true) -- enable highlight search
  utils.opt("o", "incsearch", true) -- enable inline search
  utils.opt("o", "ignorecase", true) -- enable ignore case sensitivity
  utils.opt("o", "smartcase", true) -- enable smart casing

  -- Extras
  utils.opt("o", "list", true) -- enable highlighting of the current line
  utils.opt("o", "textwidth", 0) -- default textwidth
  utils.opt("o", "viewoptions", "cursor,slash,folds,unix") -- default viewoptions

  -- Highlight on yank
  cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

  -- Clipboard & Mouse
  utils.opt("o", "clipboard", "unnamedplus")
  utils.opt("o", "mouse", "a")
end

return settings
