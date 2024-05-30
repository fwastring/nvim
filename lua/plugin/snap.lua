local snap = require'snap'
snap.maps {
  {"<Space>f", snap.config.file {producer = "ripgrep.file"}},
  {"<Leader>b", snap.config.file {producer = "vim.buffer"}},
  -- {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
  {"<Leader>g", snap.config.vimgrep {}},
}
