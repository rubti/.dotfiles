return {
	"mason-org/mason-lspconfig.nvim",
	opts = function()
		local ls = { "pylsp", "lua_ls", "beancount" }
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)
		for i, v in pairs(ls) do
			vim.lsp.config(v, { capabilities = capabilities })
		end
		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						rope_autoimport = {
							enabled = true,
						},
						pycodestyle = {
							maxLineLength = 88,
						},
					},
				},
			},
		})
		return {
			ensure_installed = ls,
		}
	end,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					snippet = {
						-- REQUIRED - you must specify a snippet engine
						expand = function(args)
							require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
						["<C-p"] = cmp.mapping.select_prev_item(),
						["<C-n"] = cmp.mapping.select_next_item(),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" }, -- For luasnip users.
						{ name = "nvim_lua" },
						{ name = "path" },
						{ name = "buffer" },
						{ name = "nvim_lsp_signature_help" },
					}),
				})
				cmp.setup.cmdline({ "/", "?" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
					matching = { disallow_symbol_nonprefix_matching = false },
				})
			end,
		},
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		-- Snippets
		{
			"L3MON4D3/LuaSnip",
			opts = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				return {}
			end,
		},
		"rafamadriz/friendly-snippets",
	},
}
