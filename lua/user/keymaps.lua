-- lua/user/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)

map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("i", "jk", "<ESC>", opts)
map("n", "<ESC>", ":noh<CR>", opts)

map("n", "<C-p>", vim.diagnostic.open_float, opts) -- open erros in a window

map("n", "gd", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
