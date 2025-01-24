local telescope = require('telescope')


telescope.setup {
	extensions = {
		fzf = {
		  fuzzy = true,                    -- false will only do exact matching
		  override_generic_sorter = true,  -- override the generic sorter
		  override_file_sorter = true,     -- override the file sorter
		  case_mode = "respect_case",        -- or "ignore_case" or "respect_case"
										   -- the default case_mode is "smart_case"
		},
		file_browser = {
		  theme = "ivy",
		  -- disables netrw and use telescope-file-browser in its place
		  hijack_netrw = true,
		  mappings = {
			["i"] = {
			  -- your custom insert mode mappings
			},
			["n"] = {
			  -- your custom normal mode mappings
			},
		  },
		},
	  },
	pickers = {
		find_files = {
			hidden = true,
			theme = "dropdown"
		},
		live_grep = {
			additional_args = function(_)
				return {
					"--hidden"
				}
			end
		}
	}
}

telescope.load_extension "file_browser"
telescope.load_extension("scope")
