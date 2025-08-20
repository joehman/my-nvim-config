require("lazy").setup({
    { "nvim-tree/nvim-tree.lua", config = true },
    { "nvim-telescope/telescope.nvim", tag = '0.1.5', dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "morhetz/gruvbox" }, -- or your favorite theme
})