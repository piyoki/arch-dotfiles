local use = require("packer").use

return require("packer").startup(
  function()
    -- core
    use({"wbthomason/packer.nvim"})
    use({"nvim-lua/popup.nvim"})
    use({"nvim-lua/plenary.nvim"})

    -- colorscheme
    use({"lourenci/github-colors"})

    -- interface
    use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}})
    use({"kyazdani42/nvim-web-devicons"})
    use({"romgrk/barbar.nvim"})
    use({"yamatsum/nvim-cursorline"})

    -- lsp related
    use({"neovim/nvim-lspconfig"})
    use({"williamboman/nvim-lsp-installer"})
    use({"folke/lsp-colors.nvim"})
    use({"folke/lua-dev.nvim"})
    use({"onsails/lspkind-nvim"})
    use({"hrsh7th/nvim-cmp"})
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use({"nvim-treesitter/nvim-treesitter-textobjects"})
    -- use({"lewis6991/spellsitter.nvim"})
    use("famiu/bufdelete.nvim")

    -- git
    use({"tpope/vim-fugitive"})
    use({"lewis6991/gitsigns.nvim"})

    -- IDE-like development
    use({"hrsh7th/cmp-buffer"})
    use({"hrsh7th/cmp-path"})
    use({"hrsh7th/cmp-nvim-lsp"})
    use({"hrsh7th/cmp-nvim-lua"})
    use({"hrsh7th/cmp-vsnip"})
    use({"hrsh7th/vim-vsnip"})
    use({"mattn/emmet-vim"})
    use({"rafamadriz/friendly-snippets"})
    use({"b0o/schemastore.nvim"})
    use({"jose-elias-alvarez/null-ls.nvim"})
    use({"folke/trouble.nvim"})
    use({"tpope/vim-commentary"})
    use({"tpope/vim-unimpaired"})
    use({"tpope/vim-sleuth"})
    use({"tpope/vim-surround"})
    use({"lewis6991/impatient.nvim"})
    use({"windwp/nvim-autopairs"})
    use({"norcalli/nvim-colorizer.lua"})
    use({"mhartington/formatter.nvim"})
    use({"godlygeek/tabular"})
    use({"folke/twilight.nvim"})
    use({"lukas-reineke/indent-blankline.nvim"})

    -- tools
    use({"phaazon/hop.nvim"})
    use({"numtostr/FTerm.nvim"})
    use({"folke/which-key.nvim"})
    use(
      {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = [[vim.g.startuptime_tries = 10]]
      }
    )
    use({"wakatime/vim-wakatime"})

    -- searching & filtering
    use({"nvim-telescope/telescope.nvim"})
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use({"nvim-telescope/telescope-file-browser.nvim"})
    use({"haya14busa/incsearch.vim"})

    -- markdown support
    use(
      {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
          vim.g.mkdp_filetypes = {"markdown"}
        end,
        ft = {"markdown"}
      }
    )
  end
)
