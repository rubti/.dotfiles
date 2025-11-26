return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	opts = function()
		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		return {
			check_ts = true,
			ts_config = {
				lua = { "string" },
				python = { "string" },
			},
			fast_wrap = {},
		}
	end,
}
