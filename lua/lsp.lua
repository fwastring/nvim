
vim.lsp.enable('volar')
vim.lsp.enable('omnisharp')
vim.lsp.enable('gopls')
vim.lsp.enable('nixd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('yamlls')
vim.lsp.enable('jsonls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('clangd')
vim.lsp.enable('hls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('bashls')
vim.lsp.enable('dockerls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('ltex')
vim.lsp.enable('ts_ls')
vim.lsp.enable('marksman')

vim.lsp.config('ltex', {
  cmd = { "ltex-ls" },
  filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text" },
  settings = {
    ltex = {
      enabled = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context", "html", "xhtml", "mail", "plaintext" }
    }
  }
})

vim.lsp.config('bashls', {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" }
})

vim.lsp.config('tinymist', {
  cmd = { "tinymist" },
  filetypes = { "typst" }
})

vim.lsp.config('marksman', {
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" }
})

vim.lsp.config('dockerls', {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" }
})


vim.lsp.config('docker_compose_language_service', {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml.docker-compose" }
})

vim.lsp.config('rust_analyzer', {
  cmd = { "rust_analyzer" },
  filetypes = { "rust" }
})

vim.lsp.config('hls', {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filetypes = { "haskell" }
})

vim.lsp.config('clangd', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
})

vim.lsp.config('tailwindcss', {
  -- add filetypes for typescript, javascript and vue
  cmd =  { "tailwindcss-language-server", "--stdio" },
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" }
})

vim.lsp.config('jsonls', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json" },
})

vim.lsp.config('lua_ls', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
})

vim.lsp.config('gopls', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
})

vim.lsp.config('yamlls', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yml" },
})

vim.lsp.config('volar', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
	  typescript = {
		tsdk = "/home/fw/dev/ifacts-ops/frontend/node_modules/typescript/lib"
	  }
  },
  root_markers = { "package.json" }
})

vim.lsp.config('ts_ls', {

  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
})

vim.lsp.config('omnisharp', {
	cmd = { "OmniSharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
	filetypes =  { "cs", "vb" }
})
