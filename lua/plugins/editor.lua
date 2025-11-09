return {
	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				blame = "<Leader>gb",
				browse = "<Leader>go",
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Find Plugin File",
			},
			{ ";f", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
			{ ";r", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "\\\\", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ ";t", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ ";;", "<cmd>Telescope resume<cr>", desc = "Resume" },
			{ ";e", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
			{ ";s", "<cmd>Telescope treesitter<cr>", desc = "Treesitter Symbols" },
			{ ";c", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Incoming Calls" },
			{
				"sf",
				function()
					require("telescope").extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = vim.fn.expand("%:p:h"),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "File Browser",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = telescope.extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
			})

			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
				},
			}

			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						n = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			}

			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},

	{
		"kazhala/close-buffers.nvim",
		keys = {
			{ "<leader>bh", "<cmd>lua require('close_buffers').delete({ type = 'hidden' })<cr>", desc = "Close Hidden Buffers" },
			{ "<leader>bu", "<cmd>lua require('close_buffers').delete({ type = 'nameless' })<cr>", desc = "Close Nameless Buffers" },
		},
	},
}
