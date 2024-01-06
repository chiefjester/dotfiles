-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
---- make oil work like vim-vinegar

-- make oil work like vim-vinegar
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- general enhancements
vim.keymap.del("n", "<leader>qq")
vim.keymap.del({ "x", "n" }, "<leader>qÞ")
vim.keymap.set("n", "<leader>q", ":silent q<cr>", { desc = "Close Window", silent = true })
vim.keymap.set("n", "<leader>z", ":silent update<cr>", { desc = "Save", silent = true })
vim.keymap.set("n", "<leader>o", ":only<cr>", { desc = "Only", silent = true })
vim.keymap.set("n", "<leader>gs", ":Git<cr>", { desc = "Git Status", silent = true })
