require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}
lspconfig.tsserver.setup {}
lspconfig.ccls.setup {}
