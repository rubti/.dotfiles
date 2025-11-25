return {
    {
        "nvim-treesitter/nvim-treesitter",
        tag = 'v0.10.0',
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "latex", "python", "beancount", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    }
}
