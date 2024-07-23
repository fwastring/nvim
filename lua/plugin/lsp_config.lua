-- LSP Setup
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
require 'lspconfig'.hls.setup {}
require 'lspconfig'.omnisharp.setup {
	cmd = { "/home/fw/.nix-profile/bin/dotnet", "/home/fw/.local/share/lvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
}
require 'lspconfig'.clojure_lsp.setup {}
require 'lspconfig'.nil_ls.setup {}
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
require'lspconfig'.vls.setup{}
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}
require'lspconfig'.vuels.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.gopls.setup{}
