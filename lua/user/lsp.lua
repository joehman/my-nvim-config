
local lspconfig = require("lspconfig")

local cmp = require("cmp")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
        format = {
            enable = true,
            tabSize = 4
        },
        completion = {
            callSnippet = "Replace";
        },
    },
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--completion-style=detailed",
        "--cross-file-rename"
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

lspconfig.glsl_analyzer.setup {
    capabilities = capabilities
}

-- Completion
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "nvim_lsp_signature_help"}
    },
})

vim.diagnostic.config({
    virtual_text = {
        prefix = "* ",
        spacing = 2,
    },
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = true
})
