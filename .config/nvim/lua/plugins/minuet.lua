return {
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				virtualtext = {
					auto_trigger_ft = { "python" },
					keymap = {
						-- accept whole completion
						accept = "<A-A>",
						-- accept one line
						accept_line = "<A-a>",
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = "<A-z>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-[>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-]>",
						dismiss = "<A-e>",
					},
				},
				context_window = 16000,
				n_completions = 1,
				provider = "openai_compatible",
				request_timeout = 2.0,
				throttle = 1000, -- Increase to reduce costs and avoid rate limits
				debounce = 250, -- Increase to reduce costs and avoid rate limits
				provider_options = {
					openai_compatible = {
						api_key = "OPENROUTER_API_KEY",
						end_point = "https://openrouter.ai/api/v1/chat/completions",
						model = "google/gemini-2.5-flash-lite",
						name = "Openrouter",
						optional = {
							max_tokens = 56,
							top_p = 0.9,
							provider = {
								-- Prioritize throughput for faster completion
								sort = "throughput",
							},
							-- disable thinking to avoid first token latency
							reasoning_effort = "none",
						},
					},
				},
			})
		end,
	},
}
