-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local terminal_prefix = lvim.builtin.terminal
local keybinding_prefix = lvim.keys.normal_mode

lvim.format_on_save = false
vim.diagnostic.config({ virtual_text = true })
lvim.colorscheme = "vscode"

lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.context_commentstring = nil

-- auto install treesitter parsers
lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }

lvim.builtin.telescope.defaults.file_ignore_patterns = { "%.git/", "build/", "lib/", "%.cache/", "%.o$", "%.obj$",
  "%.png$", "%.jpg$" }

-- Add your own plugins here!!!
table.insert(lvim.plugins, {
  "p00f/clangd_extensions.nvim",
  "lunarvim/colorschemes",
  "Mofiqul/vscode.nvim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Overriding LunarVim's default keybindings
keybinding_prefix["<C-f>"] = ":Telescope find_files<CR>"
keybinding_prefix["<C-b>"] = ":NvimTreeToggle<CR>"
keybinding_prefix["<leader>r"] = ":NvimTreeRefresh<CR>"
keybinding_prefix["<C-n>"] = ":bnext<CR>"
keybinding_prefix["<C-p>"] = ":bprevious<CR>"
keybinding_prefix["<C-q>"] = ":bd<CR>"
--keybinding_prefix["<C-t>"] = ":ToggleTerm<CR>"
keybinding_prefix["<leader>db"] = ":DapToggleBreakpoint<CR>"
keybinding_prefix["<leader>dr"] = ":DapContinue<CR>"

vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- ToggleTerm settings
terminal_prefix.direction = "horizontal"
terminal_prefix.size = 10

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  "--background-index",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory",     -- could also be disk
  "--folding-ranges",
  "--enable-config",          -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "clang-format",
    filetype = { "c", "cpp", "cs", "java" },
    extra_args = { "--style", "file:~/.clang-format" }
  }
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
  require("lvim.lsp").common_on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
  vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
  vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
  vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
  require("lvim.lsp").common_on_init(client, bufnr)
  require("clangd_extensions.config").setup {}
  require("clangd_extensions.ast").init()
  vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
  cmd = { provider, unpack(clangd_flags) },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

-- Define the lvim.lang table
lvim.lang = {
  -- Set up clang-format for formatting C/C++ files
  cpp = {
    formatters = {
      {
        exe = "clang-format",
      },
    },
    -- Ensure clang-format is installed
    linters = {
      {
        exe = "clang-format",
      },
    },
  },
}

-- Ensure clang-format is used for formatting C files as well
lvim.lang.c = lvim.lang.cpp


require("lvim.lsp.manager").setup("clangd", opts)

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end
