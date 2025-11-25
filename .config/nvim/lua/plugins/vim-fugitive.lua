return {
	{
        "tpope/vim-fugitive",
        tag = 'v3.7',
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
}
