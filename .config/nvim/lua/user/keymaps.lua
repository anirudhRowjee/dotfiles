-- keymappings!

local opts = {
    noremap = true,
    silent = true
}

local term_ops = {
    silent = true
}

-- alias?
local keymap = vim.api.nvim_set_keymap

-- all hail the new leader, space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NAVIGATION --
-- Resize to disable arrow keys (GOD MODE)
keymap("n", "<Up>",     ":resize +2<CR>" , opts)
keymap("n", "<Down>",   ":resize -2<CR>" , opts)
keymap("n", "<Left>",   ":vertical resize +2<CR>" , opts)
keymap("n", "<Right>",  ":vertical resize -2<CR>" , opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<tab>", "<C-w>w", opts)
-- keymap("n", "<C-t>", ":Lex<CR>", opts)
-- keymap("n", "<leader>mk", ":Neomake<CR>", opts)
keymap("n", "<leader><space>", ":nohlsearch<CR>", opts)
keymap("n", "<leader>rc", ":e $MYVIMRC<CR>", opts)
keymap("n", "<leader>i3", ":e ~/.config/i3/config<CR>", opts)
keymap("n", "<leader>src", ":source $MYVIMRC<CR>", opts)
-- keymap("n", "<leader>fi", "magg=G`a", opts)
keymap("n", "<leader>sm", ":Goyo<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>-", ":sp<CR>", opts)
keymap("n", "<leader>|", ":vs<CR>", opts)
-- keymap("n", "<leader>f", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>v", ":Vista<CR>", opts)
-- keymap("n", "<leader>l", ":call OpenLabFiles()<CR>", opts)
-- keymap("n", "<leader>pi", ":PlugInstall()<CR>", opts)
-- keymap("n", "<leader>m", ":MarkdownPreview<CR>", opts)
-- keymap("n", "<leader>tb", ":term ++curwin<CR>", opts)
-- keymap("n", "<leader>j", "<down>", opts)
-- keymap("n", "<leader>k", "<up>", opts)
-- keymap("n", "<leader>p", ":Files<CR>", opts)
-- keymap("n", "<leader>b", ":BTags<CR>", opts)
-- keymap("n", "<leader>gb", ":GitBlame<CR>", opts)
-- keymap("n", "<leader>gc", ":Commits<CR>", opts)
-- keymap("n", "<leader>gbc", ":BCommits<CR>", opts)
-- keymap("n", "<leader>tt", ":Windows<CR>", opts)
-- keymap("n", "<leader>bb", ":Buffers<CR>", opts)
-- keymap("n", "<leader>mm", ":Maps<CR>", opts)
-- keymap("n", "<leader>t", ":Tags<CR>", opts)

-- TODO fix this terminal keybinding
-- keymap("t", "<Esc>", "<C-\><C-n>", opts)
-- keymap("n", "<silent>", "<C-d> :Lspsaga open_floaterm<CR>", opts)
-- keymap("n", "<silent>", "<C-d> <C-\><C-n>:Lspsaga close_floaterm<CR>", opts)

keymap("n", "<space>d", ":TroubleToggle<CR>", opts)



