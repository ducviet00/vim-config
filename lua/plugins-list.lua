local cmd = vim.cmd

cmd("packadd packer.nvim")

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/opt/packer.nvim"

  print("Cloning packer..")
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "20",
    packer_path,
  })

  cmd("packadd packer.nvim")
  present, packer = pcall(require, "packer")

  if present then
    print("Packer cloned successfully.")
  else
    error(
      "Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer
    )
  end
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  --    auto_reload_compiled = true
})

local vim = vim
require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use("neovim/nvim-lspconfig")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    branch = "main",
    run = 'make'
  })
  use({
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use("jiangmiao/auto-pairs")
  use({
    "folke/trouble.nvim",
    branch = "main",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "lewis6991/gitsigns.nvim",
    branch = 'main',
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "folke/which-key.nvim",
    branch = "main",
  })
  use("tpope/vim-commentary")
  use({
    "p00f/nvim-ts-rainbow",
    branch = "master",
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  })
  use("lukas-reineke/indent-blankline.nvim")
  use("tpope/vim-fugitive")
  use("ntpeters/vim-better-whitespace")
  use("editorconfig/editorconfig-vim")
  use("easymotion/vim-easymotion")
  use("tpope/vim-surround")
  use("haya14busa/incsearch.vim")
  use("tpope/vim-abolish")
  use("scrooloose/nerdcommenter")
  use({
    "RRethy/vim-hexokinase",
    run = 'make hexokinase'
  })
  use("mhinz/vim-startify")
  use("junegunn/gv.vim")
  use("machakann/vim-highlightedyank")
  use({
    "fatih/vim-go",
    run = ':GoUpdateBinaries'
  })
  use({
    "onsails/lspkind-nvim",
    event = "VimEnter"
  })
  use({
      "hrsh7th/nvim-cmp",
      branch = 'main',
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      }
  })
  use({
    "quangnguyen30192/cmp-nvim-ultisnips",
    after = {'nvim-cmp', 'ultisnips'}
  })
  use({
    "honza/vim-snippets",
    after = 'ultisnips'
  })
  use({
    "SirVer/ultisnips",
    event = 'InsertEnter'
  })
  use({"mhinz/vim-signify", event = 'BufEnter'})
  use("nvim-lualine/lualine.nvim")
  use { "sainnhe/gruvbox-material" }
  use("chrisbra/csv.vim")
  use("ellisonleao/glow.nvim")
  use({
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim' }
  })
end)
