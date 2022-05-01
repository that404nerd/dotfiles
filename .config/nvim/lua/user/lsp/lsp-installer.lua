local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if (not status) then return end

lsp_installer.on_server_ready(function(server)
  local opts = {}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

  server:setup(opts)
end)

