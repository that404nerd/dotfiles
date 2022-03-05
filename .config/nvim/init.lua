require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.treesitter"
require "user.lsp-keymaps"
require "user.null-ls"
require "user.autopairs"
require "user.cmp"
require "user.comment"
require "user.nvim-tree"
require "user.toggleterm"
require "user.bufferline"
require "user.lualine"

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)

