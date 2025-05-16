return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"jsonls",
				"ts_ls",
				"tailwindcss",
				"lua_ls", -- lua
				"pyright", -- python
				"bashls", -- bash
				"yamlls", -- yaml
				"docker_compose_language_service",
				"dockerls", -- docker
				"ansiblels", -- ansible
				"nginx_language_server", -- nginx
				"terraformls", -- terraform
				"vimls", -- vim
				"grammarly", -- text
			},
		})

		require("mason-tool-installer").setup({
			automatic_installation = true,
			ensure_installed = {

				-- DAP
				"stylua", -- lua
				"debugpy", -- python
				"bash-debug-adapter", -- bash

				-- Linter
				"luacheck", -- lua
				"pylint", -- python
				"shellcheck", -- bash
				"yamllint", -- yaml
				"hadolint", -- docker
				"sonarlint-language-server", -- kubernetes
				"editorconfig-checker", -- config
				"tflint", -- terraform
				"vint", -- vim
				"textlint", -- text

				-- Formatter
				"prettier", --check
				"stylua", -- lua
				"black", -- python
				"shfmt",
				"beautysh", -- bash
				"yamlfmt", -- yaml
			},
		})
	end,
}