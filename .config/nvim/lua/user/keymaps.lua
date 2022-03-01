local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- other keymaps
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

-- buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-q>", ":bd<CR>", opts)

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
