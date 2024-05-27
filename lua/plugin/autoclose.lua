require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = { "haskell", "bash", "php" } },
		["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "markdown" } },
		["`"] = { escape = true, close = true, pair = "``", disabled_filetypes = { "markdown" } },
	},
})
