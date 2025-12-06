-- lua/user/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)

map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- switch between windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- enter normal mode with jk  
map("i", "jk", "<ESC>", opts)

-- clear / searches
map("n", "<ESC>", ":noh<CR>", opts)

map("n", "<C-p>", vim.diagnostic.open_float, opts) -- open erros in a window


-- Telescope
map("n", "gf", ":Telescope find_files<CR>", opts)

-- for clangd
map("n", "gd", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gs", require("telescope.builtin").lsp_workspace_symbols, opts); -- find symbol

-- thanks chatgpt!
local ts_select = require("nvim-treesitter.textobjects.select")
local ts_move = require("nvim-treesitter.textobjects.move")
local ts_is = require("nvim-treesitter.incremental_selection")

-- =============================
-- 📦 Argument Textobjects
-- =============================

-- Select inside/around arguments
vim.keymap.set({ "x", "o" }, "ia", function()
  ts_select.select_textobject("@parameter.inner")
end, { desc = "Select inside argument" })

vim.keymap.set({ "x", "o" }, "aa", function()
  ts_select.select_textobject("@parameter.outer")
end, { desc = "Select around argument" })

-- =============================
-- 🧩 Function, Class and Argument Navigation
-- =============================

vim.keymap.set("n", "<leader>nf", function()
  ts_move.goto_next_start("@function.inner")
end, { desc = "Next function" })

vim.keymap.set("n", "<leader>bf", function()
  ts_move.goto_previous_start("@function.inner")
end, { desc = "Previous function" })

vim.keymap.set("n", "<leader>nc", function()
  ts_move.goto_next_start("@class.inner")
end, { desc = "Next class" })

vim.keymap.set("n", "<leader>bc", function()
  ts_move.goto_previous_start("@class.inner")
end, { desc = "Previous class" })

vim.keymap.set("n", "<leader>na", function()
  ts_move.goto_next_start("@parameter.inner")
end, { desc = "Next argument" })

vim.keymap.set("n", "<leader>ba", function()
  ts_move.goto_previous_start("@parameter.inner")
end, { desc = "Previous argument" })


-- =============================
-- 🪄 Incremental Selection
-- =============================

vim.keymap.set("n", "gnn", function()
  ts_is.init_selection()
end, { desc = "Init incremental selection" })

vim.keymap.set("n", "grn", function()
  ts_is.node_incremental()
end, { desc = "Increment node selection" })

vim.keymap.set("n", "grc", function()
  ts_is.scope_incremental()
end, { desc = "Increment scope selection" })

vim.keymap.set("n", "grm", function()
  ts_is.node_decremental()
end, { desc = "Decrement node selection" })

-- =============================
-- 🧠 Textobject Selection (Functions & Classes)
-- =============================

vim.keymap.set({ "x", "o" }, "if", function()
  ts_select.select_textobject("@function.inner")
end, { desc = "Select inside function" })

vim.keymap.set({ "x", "o" }, "af", function()
  ts_select.select_textobject("@function.outer")
end, { desc = "Select around function" })

vim.keymap.set({ "x", "o" }, "ic", function()
  ts_select.select_textobject("@class.inner")
end, { desc = "Select inside class" })

vim.keymap.set({ "x", "o" }, "ac", function()
  ts_select.select_textobject("@class.outer")
end, { desc = "Select around class" })

vim.keymap.set({ "x", "o" }, "ia", function()
  ts_select.select_textobject("@parameter.inner")
end, { desc = "Select inside argument" })

vim.keymap.set({ "x", "o" }, "aa", function()
  ts_select.select_textobject("@parameter.outer")
end, { desc = "Select around argument" })
