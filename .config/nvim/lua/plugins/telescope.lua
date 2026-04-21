return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	opts = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git filesTelescope find files" })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })
		return {
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("ui-select")
	end,
}
