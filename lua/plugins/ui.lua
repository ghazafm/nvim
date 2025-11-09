return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			-- Skip "No information available" notifications
			table.insert(opts.routes, {
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			})

			-- Send notifications when unfocused
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},

	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
			dashboard = {
				preset = {
					header = [[
          _____                    _____                    _____                    _____                    _____
         /\    \                  /\    \                  /\    \                  /\    \                  /\    \
        /::\    \                /::\____\                /::\    \                /::\    \                /::\    \
       /::::\    \              /:::/    /               /::::\    \               \:::\    \              /::::\    \
      /::::::\    \            /:::/    /               /::::::\    \               \:::\    \            /::::::\    \
     /:::/\:::\    \          /:::/    /               /:::/\:::\    \               \:::\    \          /:::/\:::\    \
    /:::/  \:::\    \        /:::/____/               /:::/__\:::\    \               \:::\    \        /:::/__\:::\    \
   /:::/    \:::\    \      /::::\    \              /::::\   \:::\    \               \:::\    \      /::::\   \:::\    \
  /:::/    / \:::\    \    /::::::\    \   _____    /::::::\   \:::\    \               \:::\    \    /::::::\   \:::\    \
 /:::/    /   \:::\ ___\  /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \               \:::\    \  /:::/\:::\   \:::\    \
/:::/____/  ___\:::|    |/:::/  \:::\    /::\____\/:::/  \:::\   \:::\____\_______________\:::\____\/:::/  \:::\   \:::\____\
\:::\    \ /\  /:::|____|\::/    \:::\  /:::/    /\::/    \:::\  /:::/    /\::::::::::::::::::/    /\::/    \:::\  /:::/    /
 \:::\    /::\ \::/    /  \/____/ \:::\/:::/    /  \/____/ \:::\/:::/    /  \::::::::::::::::/____/  \/____/ \:::\/:::/    /
  \:::\   \:::\ \/____/            \::::::/    /            \::::::/    /    \:::\~~~~\~~~~~~                 \::::::/    /
   \:::\   \:::\____\               \::::/    /              \::::/    /      \:::\    \                       \::::/    /
    \:::\  /:::/    /               /:::/    /               /:::/    /        \:::\    \                      /:::/    /
     \:::\/:::/    /               /:::/    /               /:::/    /          \:::\    \                    /:::/    /
      \::::::/    /               /:::/    /               /:::/    /            \:::\    \                  /:::/    /
       \::::/    /               /:::/    /               /:::/    /              \:::\____\                /:::/    /
        \::/____/                \::/    /                \::/    /                \::/    /                \::/    /
                                  \/____/                  \/____/                  \/____/                  \/____/
]],
				},
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				mode = "buffers",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}
