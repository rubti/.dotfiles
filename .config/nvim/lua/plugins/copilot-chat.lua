return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		keys = {
			{ "<leader>cp", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
		},
		opts = {
			model = "gpt-4.1", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float'
				width = 0.5, -- 50% of screen width
			},
			auto_insert_mode = false, -- Enter insert mode when opening
			mappings = {
				complete = { insert = "<S-Tab>" },
				submit_prompt = { insert = "<C-CR>" },
			},
			headers = {
				user = "👤 You",
				assistant = "🤖 Copilot",
				tool = "🔧 Tool",
			},

			separator = "━━",
			auto_fold = true, -- Automatically folds non-assistant messages
		},
	},
}
