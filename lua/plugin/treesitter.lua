require 'nvim-treesitter'.setup()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.csharp = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-c-sharp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cs", -- if filetype does not match the parser name
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "haskell", "python", "bash", "clojure",  "nix", "dockerfile", "csharp", "markdown", "json", "vue", "typescript" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
