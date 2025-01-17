local telescope = require('telescope')
telescope.load_extension("yank_history")


telescope.setup {
	extensions = {
		fzf = {
		  fuzzy = true,                    -- false will only do exact matching
		  override_generic_sorter = true,  -- override the generic sorter
		  override_file_sorter = true,     -- override the file sorter
		  case_mode = "respect_case",        -- or "ignore_case" or "respect_case"
										   -- the default case_mode is "smart_case"
		}
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
