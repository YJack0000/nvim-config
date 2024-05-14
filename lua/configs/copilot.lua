require("copilot").setup {
    -- Possible configurable fields can be found on:
    -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
    suggestion = {
        enable = false,
    },
    panel = {
        enable = false,
    },
    filetypes = {
        jsx = true,
        lua = true,
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
}
