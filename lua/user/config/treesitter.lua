local ts = require("nvim-treesitter.configs")

ts.setup({
    highlight = { enable = true },
    indent = { enable = true },

    incremental_selection = { enable = true },
    textobjects = {
        select = { enable = true, lookahead = true },
        move = { enable = true, set_jumps = true },
        set_jumps = true
    },
})
