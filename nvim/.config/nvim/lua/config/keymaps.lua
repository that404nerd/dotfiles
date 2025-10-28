-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set
local mapDel = vim.keymap.del

map("n", "<tab>p", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>q", "<cmd>bd<cr>", { desc = "Delete Current Buffer" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fa", "<cmd>Telescope<cr>", { desc = "Find All" })
map("n", "<leader>bb", "<cmd>Neotree<cr>", { desc = "Open Neotree" })
map("n", "<leader>bb", "<cmd>Neotree toggle<cr>", { desc = "Open Neotree" })
map("n", "<tab>j", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<tab>k", "<cmd>m .-2<cr>==", { desc = "Move Up" })

-- Delete some keymaps
mapDel("n", "<leader><leader>") -- Open Telescope
mapDel("n", "<leader>p")
