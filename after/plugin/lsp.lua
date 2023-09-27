local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>v", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'csharp_ls', 'cmake', 'lua_ls', 'sqlls' },
    handlers = {
        lsp_zero.default_setup,
        csharp_ls = function ()
            local lspconfig = require('lspconfig')
            lspconfig.csharp_ls.setup({
                root_dir = function(startpath)
                    return lspconfig.util.root_pattern("*.sln")(startpath)
                    or lspconfig.util.root_pattern("*.csproj")(startpath)
                    or lspconfig.util.root_pattern("*.fsproj")(startpath)
                    or lspconfig.util.root_pattern(".git")(startpath)
                end,
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `tab` key to confirm completion
    ['<tab>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  })
})

