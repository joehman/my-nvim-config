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

map("n", "ö", ":");

map("n", "<C-n>", ":Hexplore<CR>", opts)
map("n", "<C-b>", ":Explore<CR>", opts)

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

-- for clangd
map("n", "gd", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gs", require("telescope.builtin").lsp_dynamic_workspace_symbols , opts); -- find symbol

-- rename symbol
map("n", "rn", vim.lsp.buf.rename)

-- apply fixes
map("n", "fx", vim.lsp.buf.code_action)

vim.keymap.set({'n', 'v'}, '<leader>me', function()
  local mode = vim.fn.mode()
  local text

  if mode == 'v' or mode == 'V' then
    vim.cmd('noau normal! "vy')
    text = vim.fn.getreg('v')
  else
    text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  end

  local result = vim.fn.system('cc -E -P -', text)

  -- open a new split, never touches your original buffer
  vim.cmd('botright new')
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result, '\n'))
  vim.bo[buf].filetype = 'c'
  vim.bo[buf].buftype = 'nofile'   -- not backed by a file
  vim.bo[buf].bufhidden = 'wipe'   -- disappears when you close it
  vim.bo[buf].modifiable = false
  vim.keymap.set('n', 'q', '<cmd>bd!<cr>', { buffer = buf })
end, { desc = 'Expand C macros into scratch buffer' })

