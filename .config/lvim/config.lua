-- Prefix variables
local terminal_prefix = lvim.builtin.terminal
local keybinding_prefix = lvim.keys.normal_mode

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Overriding LunarVim's default keybindings
keybinding_prefix["<C-f>"] = ":Telescope find_files<CR>"
keybinding_prefix["<C-b>"] = ":NvimTreeToggle<CR>"
keybinding_prefix["<leader>r"] = ":NvimTreeRefresh<CR>"
keybinding_prefix["<C-n>"] = ":bnext<CR>"
keybinding_prefix["<C-p>"] = ":bprevious<CR>"
keybinding_prefix["<C-q>"] = ":bd<CR>"

-- ToggleTerm settings
terminal_prefix.direction = "horizontal"
terminal_prefix.size = 10

-- Indent Blankline settings
lvim.builtin.indent_blankline = {
  buftype_exclude = { "terminal" },
  filetype_exclude = { "dashboard", "NvimTree", "packer", "lsp-installer" },
  show_current_context = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "html",
}

lvim.builtin.treesitter.highlight.enabled = true

--@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)

vim.tbl_map(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    command = 'prettierd',
    formatStdin = true,
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "css" },
  },
}

-- set additional linters_info
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    filetypes = { "javascript", "python" },
  },
}

lvim.plugins = {
  -- Additional Utilities
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    'romgrk/barbar.nvim',
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
