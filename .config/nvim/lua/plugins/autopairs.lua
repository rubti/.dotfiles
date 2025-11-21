return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
        check_ts = true,
        ts_config = {
            lua = { "string" }, -- Tree-sitter Regeln für Lua
            python = { "string" },
        },
        fast_wrap = {}, -- optional: Wrap-Funktion z.B. Alt-e + Zeichen
    }
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
