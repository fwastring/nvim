require 'typst-preview'.setup {
  debug = true,

  -- Custom format string to open the output link provided with %s
  -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
  open_cmd = 'zathura' .. debug.getinfo(1).source:match("@?(.*/)") .. '%s',
  dependencies_bin = {
    ['tinymist'] = "/run/current-system/sw/bin/tinymist",
    ['websocat'] = "/run/current-system/sw/bin/websocat"
  },
}
