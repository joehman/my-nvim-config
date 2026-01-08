require("lazy").setup({
    { "nvim-tree/nvim-tree.lua", config = true },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "morhetz/gruvbox" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },

    { "mason-org/mason.nvim", opts = {}},
    { "williamboman/mason-lspconfig.nvim", opts = {}},
    { "windwp/nvim-ts-autotag", ft = {"html", "javascriptreact", "typescriptreact"} },
    { "kylechui/nvim-surround", lazy = false, config = true},
    { "Jezda1337/nvim-html-css", dependencies = {"nvim-treesitter/nvim-treesitter"}, opts = {}},

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },

        config = function()
            require('user.config.treesitter')
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("user.config.debug")
        end
    },

    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { org },
        config = function()
            require("orgmode").setup({
                org_agenda_files = "~/Documents/agendafiles/**/*",
                org_default_notes_file = "~/Documents/agendafiles/notes.org"
            })    
        end
    }
})
