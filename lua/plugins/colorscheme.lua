return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
	},
}
