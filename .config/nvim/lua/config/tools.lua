local tools = {}

function tools.setup()
  -- hop
  require("hop").setup()

  -- autopairs
  require("nvim-autopairs").setup(
    {
      check_ts = true,
      disable_filetype = {"TelescopePrompt"}
    }
  )

  -- sfm
  require("sfm").setup()

  -- telescope
  require("telescope").setup(
    {
      defaults = {
        defaults = require("telescope.themes").get_ivy(),
        file_ignore_patterns = {"node_modules", "git"}
      },
      pickers = {
        find_files = {
          find_command = {"fd", "--type", "f", "--strip-cwd-prefix"},
          hidden = true
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          hidden = true
        }
      }
    }
  )
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("harpoon")
  require("telescope").load_extension("live_grep_args")
  require("plenary.filetype").add_file("json")

  -- emmet
  vim.g.user_emmet_leader_key = "<C-z>"

  -- incsearch
  vim.g["incsearch#auto_nohlsearch"] = 1

  -- markdown preview
  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_refresh_slow = 0
  vim.g.mkdp_command_for_global = 1
  vim.g.mkdp_open_to_the_world = 1
  vim.g.mkdp_open_ip = "localhost"
  vim.g.mkdp_browser = ""
  vim.g.mkdp_echo_preview_url = 0
  vim.api.nvim_command([[
  function! g:EchoUrl(url)
      :echo 'MARKDOWN_PREVIEW_URL: 'a:url
  endfunction
  ]])
  vim.g.mkdp_browserfunc = "EchoUrl"
  vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = "middle",
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = "v:false",
    disable_filename = 0
  }
  vim.g.mkdp_markdown_css = ""
  vim.g.mkdp_highlight_css = ""
  vim.g.mkdp_port = "8090"
  vim.g.mkdp_page_title = "「${name}」"
  vim.g.mkdp_filetypes = "markdown"
end

return tools
