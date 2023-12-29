local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",

        "vue",

        "go",
        "gosum",
        "gowork",
        "gomod",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettierd",
        "tailwindcss-language-server",
        "eslint-lsp",
        -- vue stuff
        "vue-language-server",

        -- docker stuff
        "docker-compose-language-service",
        "dockerfile-language-server",

        -- python stuff
        "pyright",
        "mypy",
        "ruff",
        "black",

        -- golang stuff
        "gopls",

        -- c/cpp stuff
        "clangd",
        "clang-format",
    },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
        ignore = false,
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

return M
