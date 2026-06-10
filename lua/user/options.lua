vim.g.mapleader = " "

-- lua/user/options.lua
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.confirm = true
vim.opt.scrolloff = 7

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions:append("t")
    end
})

-- netrw
vim.g.netrw_list_hide = [[^\.[^.]]
vim.g.netrw_hide = 1
vim.g.netrw_hide = 1

vim.g.netrw_liststyle = 1
vim.g.netrw_alto = 1
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.g.netrw_fastbrowse = 2
