local use = require("packer").use

return require("packer").startup(
  function()
    -- core
    use({"wbthomason/packer.nvim"})
    use({"nvim-lua/plenary.nvim"})
    use({"airblade/vim-rooter"})

    -- colorscheme
    use({"lourenci/github-colors"})
    use({"projekt0n/github-nvim-theme", tag = "v0.0.7"})

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

    -- git
    use({"lewis6991/gitsigns.nvim"})
    use({"f-person/git-blame.nvim"})
    use({"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"})
    use({"yorik1984/lazygit.nvim"})

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
    use({"lukas-reineke/indent-blankline.nvim"})
    use({"preservim/tagbar"})
    use({"CRAG666/code_runner.nvim"})
    use({"kshenoy/vim-signature"})

    -- tools
    use({"phaazon/hop.nvim"})
    use({"ThePrimeagen/harpoon"})
    use({"numtostr/FTerm.nvim"})
    use({"folke/which-key.nvim"})
    use({"wakatime/vim-wakatime"})
    use({"ahmedkhalf/project.nvim"})
    use(
      {
        "dinhhuy258/sfm.nvim",
        requires = {
          "dinhhuy258/sfm-git.nvim",
          "dinhhuy258/sfm-fs.nvim",
          "dinhhuy258/sfm-telescope.nvim"
        }
      }
    )

    -- searching & filtering
    use({"nvim-telescope/telescope.nvim"})
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use({"nvim-telescope/telescope-file-browser.nvim"})
    use({"nvim-telescope/telescope-live-grep-args.nvim"})
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
