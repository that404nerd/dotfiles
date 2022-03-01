local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer (vim package manager)
  use "wbthomason/packer.nvim"
  -- PopUp API Neovim
  use "nvim-lua/popup.nvim" 
  -- Nvim Tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  -- JSX Syntax
  use "maxmellon/vim-jsx-pretty"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use {
   "nvim-telescope/telescope.nvim",
   "nvim-telescope/telescope-file-browser.nvim"
  }

  -- Toggle Term for neovim
  use "akinsho/toggleterm.nvim"
  -- Tab support
  use "akinsho/bufferline.nvim"
  use "yuezk/vim-js"
  use "roxma/nvim-yarp"
  use "roxma/vim-hug-neovim-rpc"
  use "Raimondi/delimitMate"
  -- Alternative to airline
  use "itchyny/lightline.vim"
  -- CSS color syntax for neovim
  use "ap/vim-css-color"
  -- Github Themes for neovim
  use "projekt0n/github-nvim-theme"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
