

local ts = require('nvim-treesitter')

ts.setup {
    auto_install = true,

    highlight = {
        enable = true
    },
}

require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
