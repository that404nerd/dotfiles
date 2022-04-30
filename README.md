## System Coding's dotfiles
Configs of neovim, fish, zsh, bash and alacritty which you can fork, use it for yourself as well

How to get these configs:
```
$ git clone https://github.com/systemcoding/dotfiles 
$ cp -r dotfiles/file_name .config/ 
```
For eg:
```
$ cp -r dotfiles/.zshrc $HOME 
```

## Neovim
NOTE: Neovim Plugins are updated and config is using Lua instead of Vim Script


Plugins I used:
### Basic Plugins
* wbthomason/packer.nvim - https://github.com/wbthomason/packer.nvim
* nvim-lua/popup.nvim - https://github.com/nvim-lua/popup.nvim
* windwp/nvim-autopairs - https://github.com/windwp/nvim-autopairs
* kyazdani42/nvim-web-devicons - https://github.com/kyazdani42/nvim-web-devicons
* kyazdani42/nvim-tree.lua - https://github.com/kyazdani42/nvim-tree.lua
* nvim-lua/plenary.nvim - https://github.com/nvim-lua/plenary.nvim
* numToStr/Comment.nvim - https://github.com/numToStr/Comment.nvim
* JoosepAlviste/nvim-ts-context-commentstring - https://github.com/JoosepAlviste/nvim-ts-context-commentstring

### Some CMP Plugins
* hrsh7th/nvim-cmp - https://github.com/hrsh7th/nvim-cmp
* hrsh7th/cmp-buffer - https://github.com/hrsh7th/cmp-buffer
* hrsh7th/cmp-path - https://github.com/hrsh7th/cmp-path
* hrsh7th/cmp-cmdline - https://github.com/hrsh7th/cmp-cmdline
* saadparwaiz1/cmp_luasnip - https://github/saadparwaiz1/cmp_luasnip

### LSP and LSP Snippet Plugins
* neovim/nvim-lspconfig - https://github.com/neovim/nvim-lspconfig
* L3MON4D3/LuaSnip - https://github.com/L3MON4D3/LuaSnip
* rafamadriz/friendly-snippets - https://github.com/rafamadriz/friendly-snippets

### Treesitter
* nvim-treesitter/nvim-treesitter - https://github.com/nvim-treesitter/nvim-treesitter
* nvim-treesitter/playground - https://github.com/nvim-treesitter/playground

### Null LS (Formatting, Linting etc...)
* jose-elias-alvarez/null-ls.nvim - https://github.com/jose-elias-alvarez/null-ls.nvim

### Utility Plugins
* nvim-telescope/telescope.nvim - https://github.com/nvim-telescope/telescope.nvim
* nvim-telescope/telescope-file-browser.nvim - https://github.com/nvim-telescope/telescope-file-browser.nvim
* akinsho/bufferline.nvim - https://github.com/akinsho/bufferline.nvim
* akinsho/toggleterm.nvim - https://github.com/akinsho/toggleterm.nvim
* tamton-aquib/staline.nvim - https://github.com/tamton-aquib/staline.nvim

### Themes
* projeckt0n/github-nvim-theme - https://github.com/projeckt0n/github-nvim-theme

## Alacritty
Config - https://github.com/systemcoding/dotfiles/blob/main/.config/alacritty/alacritty.yml

## License
The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
