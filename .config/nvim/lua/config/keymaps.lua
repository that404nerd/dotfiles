-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

map("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-n>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-q>", "<cmd>bd<cr>", { desc = "Delete Current Buffer" })
map("n", "<C-f>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<C-b>", "<cmd>Neotree<cr>", { desc = "Open Neotree" })
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<Home>", "0", { noremap = true, silent = true })
map("n", "<End>", "$", { noremap = true, silent = true })
