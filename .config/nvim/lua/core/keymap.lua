local M = {}

local wk = require("which-key")
local utils = require("utils")
local builtin_lsp = require("builtin.lsp")
local telescope_builtin = require("telescope.builtin")
local opts = {noremap = true, silent = true}

function M.setup()
  -- Map leader to space
  vim.g.mapleader = " "

  -- Which-key setup
  wk.setup()

  -- Insert Mode Bindings
  utils.map("i", "jj", "<Esc>:w<CR>", opts) -- (I) Switch to normal mode and save
  utils.map("i", "<C-o>", "<Esc>o", opts) -- (I) Insert a new line

  -- Save, Quit, and Reload
  utils.map("", "s", "<nop>", opts)
  utils.map("n", "S", ":w<CR>", opts) -- (N) Save
  utils.map("n", "Q", "<nop>", opts) -- (N) Unbind quit
  utils.map("n", "<A-w>", ":BufferClose<CR>", opts) -- (N) Close current buffer
  utils.map("n", "R", ":source%<CR>", opts) -- (N) Reload

  -- Navigation
  utils.map("v", "<C-e>", "$", opts) -- (V) Move current cursor to the end of line
  utils.map("v", "<C-a>", "0", opts) -- (V) Move current cursor to the beginning of line
  utils.map("i", "<C-e>", "<C-o>$", opts) -- (I) Move current cursor to the end of line
  utils.map("i", "<C-a>", "<C-o>0", opts) -- (I) Move current cursor to the beginning of line
  utils.map("n", "<C-d>", "<C-d>zz", opts) -- (N) Move to next page
  utils.map("n", "<C-u>", "<C-u>zz", opts) -- (N) Move to previous page
  utils.map("n", "n", "nzzzv", opts) -- (N) Move to next keyword
  utils.map("n", "N", "Nzzzv", opts) -- (N) Move to previous keyword

  -- Move lines around
  utils.map("n", "<S-Up>", ":m-2<CR>", opts) -- (N) Move current line upward
  utils.map("n", "<S-Down>", ":m+<CR>", opts) -- (N) Move current line downward
  utils.map("i", "<S-Up>", "<Esc>:m-2<CR>", opts) -- (N) Move current line upward
  utils.map("i", "<S-Down>", "<Esc>:m+<CR>", opts) -- (N) Move current line downward

  -- Spell Check
  utils.map("n", "sc", "<cmd>set spell!<CR>") -- Enable spellcheck

  -- Highlight Search
  utils.map("n", "<LEADER><CR>", ":nohlsearch<CR>", opts) -- (N) Clear all highlight

  -- Folding
  utils.map("n", "<C-z>", "za", opts) -- (N) Fold current function

  --- Undo
  utils.map("i", "<C-c>", "<Esc>:w<CR>", opts)
  utils.map("n", "<C-c>", ":q<Esc>", opts)

  --- Paste *(no delete on register)
  utils.map("n", "<LEADER>p", '"_dP', opts)
  utils.map("v", "<LEADER>p", '"_dP', opts)
  utils.map("n", "<LEADER>y", '"*y :let @+=@*<CR>', opts)
  utils.map("v", "<LEADER>y", '"*y :let @+=@*<CR>', opts)

  ----------------------------------------------
  -- Explorer
  utils.map("", "<LEADER>r", "<cmd>Lexplore %:p:h<CR><cmd>vertical res -60<CR>") -- Open built-in file explorer
  -- Usage:
  -- Press 't' instead of pressing <cr> for a new tab, or 'v' for a new vertical split
  -- :h netrw-v for help menu

  -- Tab
  utils.map("", "tt", "<cmd>tabe<CR>") -- New tab
  utils.map("", "<LEADER>-", ":BufferPrevious<CR>") -- Jump to previous buffer
  utils.map("", "<LEADER>=", ":BufferNext<CR>") -- Jump to the next buffer

  -- Window
  utils.map("", "s|", ":set splitright<CR>:vsplit<CR>") -- Split window horizontally
  utils.map("", "s-", ":set splitbelow<CR>:split<CR>") -- Split window vertically
  utils.map("n", "<LEADER>h", "<C-w>h") -- (N) Move cursor to the left window
  utils.map("n", "<LEADER>j", "<C-w>j") -- (N) Move cursor to the bottom window
  utils.map("n", "<LEADER>k", "<C-w>k") -- (N) Move cursor to the up window
  utils.map("n", "<LEADER>l", "<C-w>l") -- (N) Move cursor to the righ window
  utils.map("n", "<S-Left>", ":vertical resize +2<CR>") -- (N) Resize vertical split window -2 to the right
  utils.map("n", "<S-Right>", ":vertical resize -2<CR>") -- (N) Resize vertical split window +2 to the left

  ----------------------------------------------

  -- Terminal
  utils.map("n", "<LEADER>,", ":terminal<CR>") -- (N) Instiatiate a new terminal window
  utils.map("t", "<Esc>", [['<C-\><C-n>']]) -- (T) Move cursor to the righ window

  -- FloatTerm
  utils.map("n", "<C-x>", ":lua require('FTerm').toggle()<CR>", opts) -- (N) Move cursor to the righ window
  utils.map("t", "<C-x>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>") -- (T) Move cursor to the righ window

  -- Lazygit
  utils.map("n", "<C-g>", ":lua require('FTerm').toggle()<CR>lazygit<CR>", opts) -- (N) Move cursor to the righ window
  utils.map("t", "<C-g>", "q<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>") -- (T) Move cursor to the righ window

  -- Commentary
  utils.map("n", "<LEADER>/", ":Commentary<CR>") -- (N) Toggle Comment
  utils.map("v", "<LEADER>/", ":Commentary<CR>") -- (V) Toggle Comment

  -- Hop
  utils.map("n", "<CR>", "<CMD>HopWord<CR>") -- (N) Jump to the target line

  --- Harpoon
  utils.map("n", "mm", ":lua require('harpoon.mark').add_file()<CR>") -- (N) Mark current file in harpoon
  utils.map("n", "<A-p>", ":lua require('harpoon.ui').nav_prev()<CR>") -- (N) Navigate to previous harpoon mark
  utils.map("n", "<A-n>", ":lua require('harpoon.ui').nav_next()<CR>") -- (N) Navigate to next harpoon mark
  utils.map("n", "<LEADER>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>") -- (N) Open up harpoon menu

  -- fugitive
  wk.register(
    {
      g = {
        name = "Git",
        g = {"<cmd>Git<CR>", "Git Status"},
        d = {"<cmd>Gvdiffsplit!<CR>", "Git Diff"},
        p = {"<cmd>Git pull<CR>", "Git Pull"},
        P = {"<cmd>Git push<CR>", "Git Push"}
      }
    },
    {
      prefix = "<Leader>"
    }
  )

  -- Barbar
  wk.register(
    {
      b = {
        name = "Buffer",
        b = {"<cmd>BufferPick<CR>", "BufferPick"},
        q = {"<cmd>BufferClose<CR>", "BufferClose"},
        o = {"<cmd>BufferOrderByBufferNumber<CR>", "BufferOrder ByNumber"},
        O = {"<cmd>BufferCloseAllButCurrent<CR>", "BufferCloseAll ButCurrent"},
        h = {"<cmd>BufferMovePrevious<CR>", "BufferMove Previous"},
        l = {"<cmd>BufferMoveNext<CR>", "BufferMove Next"},
        H = {"<cmd>BufferCloseBuffersLeft<CR>", "BufferClose Left"},
        L = {"<cmd>BufferCloseBuffersRight<CR>", "BufferClose Right"}
      },
      q = {"<cmd>BufferClose<CR>", "BufferClose"}
    },
    {
      prefix = "<Leader>"
    }
  )

  ----------------------------------------------
  --- Telescope
  wk.register(
    {
      f = {
        name = "Find",
        a = {"<cmd>Telescope builtin<CR>", "Telescope Builtin"},
        b = {"<cmd>Telescope buffers<CR>", "Telescope Buffers"},
        l = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "Telescope Buffer Search"},
        f = {"<cmd>Telescope find_files<CR>", "Telescope Find Files"},
        g = {"<cmd>Telescope git_commits<CR>", "Telescope Git Commits"},
        h = {"<cmd>Telescope help_tags<CR>", "Telescope Help"},
        j = {"<cmd>Telescope jumplist<CR>", "Telescope Jump List"},
        k = {"<cmd>Telescope keymaps<CR>", "Telescope Keymaps"},
        e = {"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", "Telescope File Browser"},
        m = {"<cmd>Telescope man_pages<CR>", "Telescope Man Pages"},
        s = {"<cmd>Telescope live_grep<CR>", "Telescope Live Grep"}
      }
    },
    {
      prefix = "<Leader>"
    }
  )

  utils.map("n", "\\", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>")
  utils.map("n", "<C-f>", "<cmd>Telescope find_files hidden=true<CR>")
  utils.map("n", "<C-e>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>")
  utils.map("n", "<C-k>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

  --- Formatter
  wk.register(
    {
      ff = {"<cmd>Format<CR>", "Format"}
    },
    {prefix = "<Leader>"}
  )

  ----------------------------------------------
end

function M.lsp_buf_register(bufnr)
  wk.register(
    {
      l = {
        name = "LSP",
        a = {
          vim.lsp.buf.code_action,
          "LSP Code Actions"
        },
        r = {
          vim.lsp.buf.rename,
          "LSP Rename"
        },
        s = {
          telescope_builtin.lsp_document_symbols,
          "LSP Document Symbols"
        },
        S = {
          telescope_builtin.lsp_workspace_symbols,
          "LSP Workspace Symbols"
        },
        f = {
          vim.lsp.buf.formatting,
          "LSP Format"
        },
        F = {
          vim.lsp.buf.formatting_seq_sync,
          "LSP Format"
        }
      }
    },
    {
      prefix = "<Leader>",
      buffer = bufnr
    }
  )

  wk.register(
    {
      gd = {
        vim.lsp.buf.definition,
        "LSP Definitions"
      },
      gi = {
        vim.lsp.buf.implementation,
        "LSP Implementations"
      },
      gD = {
        vim.lsp.buf.type_definition,
        "LSP Declaration"
      },
      gR = {
        vim.lsp.buf.references,
        "LSP References"
      },
      gt = {
        vim.lsp.buf.type_definition,
        "LSP Type Definitions"
      },
      K = {
        vim.lsp.buf.hover,
        "LSP Hover"
      },
      ["<C-k>"] = {
        builtin_lsp.peek,
        "Lsp Peek"
      }
    },
    {
      buffer = bufnr
    }
  )
end

return M
