return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    -- Quita 'lazy = false' para dejar que los 'event' manejen el lazy-loading correctamente
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "html",
            "javascript",
            "json",
            "markdown",
            "markdown_inline",
            "lua",
            "luadoc",
            "luap",
            "query",
            "regex",
            "vim",
            "vimdoc",
            "yaml",
            "rust",
            "typescript",
            "go",
            "gomod",
            "gowork",
            "gosum",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<cr>",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "<c-v>",
                },
                include_surrounding_whitespace = true,
            },
            lsp_interop = {
                enable = true,
                border = "none",
                floating_preview_opts = {},
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
        },
    },
    -- Garantiza que require("nvim-treesitter.configs") reciba la tabla opts en el momento correcto
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
