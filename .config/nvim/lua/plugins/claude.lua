return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	-- Claude runs in an external terminal: Neovim only hosts the WebSocket
	-- server. Connect from the external session with `claude --ide` or `/ide`.
	opts = {
		terminal = { provider = "none" },
	},
	-- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
	-- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
	-- spec defers loading until a <leader>a* mapping is pressed and the commands
	-- would not exist yet.
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeOpen",
		"ClaudeCodeClose",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
		"ClaudeCodeCloseAllDiffs",
	},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{
			"<leader>ac",
			function()
				local claudecode = require("claudecode")
				if not claudecode.state.server then
					claudecode.start()
				end
				if claudecode.is_claude_connected() then
					vim.notify("Claude connected (port " .. claudecode.state.port .. ")")
				else
					vim.notify(
						"Waiting for Claude on port " .. claudecode.state.port .. ": run `claude --ide` or `/ide` externally",
						vim.log.levels.WARN
					)
				end
			end,
			desc = "Connect external Claude",
		},
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
