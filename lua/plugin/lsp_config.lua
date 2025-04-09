-- LSP Setup
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr })
end)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.nix",
    callback = function()
        vim.lsp.buf.format()
    end,
})

require 'lspconfig'.nil_ls.setup {
            capabilities = capabilities,
            settings = {
                nil_ls = {
                    formatter = { command = {"nixpkgs-fmt"}},
                },
            },
        }

        require 'lspconfig'.nixd.setup {
            capabilities = capabilities,
        }
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.bashls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.docker_compose_language_service.setup {}
require 'lspconfig'.ansiblels.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.lua_ls.setup {
	settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
-- require'lspconfig'.vls.setup{}
require'lspconfig'.volar.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.texlab.setup{}
