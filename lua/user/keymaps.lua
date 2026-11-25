-- lua/user/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>cc", function()
  vim.ui.input({ prompt = "Compile command: " }, function(cmd)
    if cmd and cmd ~= "" then
      vim.cmd("!" .. cmd)
    end
  end)
end, { desc = "Compile" })

map("n", "ä", ";"); -- ; is go to next f search
map("n", "ö", ","); -- , is go to last f search

map("n", "<C-n>", ":NvimTreeOpen<CR>", opts)

-- Go to normal mode in the terminal with ESC and jk
map("t", "<ESC>", [[<C-\><C-n>]])
map("t", "jk", [[<C-\><C-n>]])

-- switch between windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- split window
map("n", "ss", ":split<CR>", opts) -- horisontally
map("n", "sv", ":vsplit<CR>", opts) -- vertically

-- enter normal mode with jk  
-- there's alot of these because I keep missclicking this
map("i", "jk", "<ESC>", opts)
map("i", "jh", "<ESC>", opts)
map("i", "Jk", "<ESC>", opts)
map("i", "jl", "<ESC>", opts)

-- clear '/' searches
map("n", "<ESC>", ":noh<CR>", opts)

-- open errors in a window
map("n", "<C-p>", vim.diagnostic.open_float, opts)

-- bind f5 to run the program
map("n", "<F5>", ":make run<CR>")
map("i", "<F5>", "<ESC>:make run<CR>")

-- Telescope
map("n", "gf", ":Telescope find_files<CR>", opts)
map("n", "gp", ":Telescope live_grep<CR>", opts)
map("n", "gh", ":Telescope diagnostics<CR>", opts)
map("n", "gb", ":Telescope buffers<CR>", opts)

-- for lsp
map("n", "gd", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gs", require("telescope.builtin").lsp_dynamic_workspace_symbols , opts); -- find symbol

-- rename symbol
map("n", "rn", vim.lsp.buf.rename)

-- apply fixes
map("n", "fx", vim.lsp.buf.code_action)
