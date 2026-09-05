return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"tree-sitter/tree-sitter-regex"
	},
	opts = {
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true, },
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
		playground = {
			enable = false,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
		},
		refactor = {
			highlight_definitions = {
				enable = true,
				clear_on_cursor_move = true,
			},
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "<space>crr",
				},
			},
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<cr>", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
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
	}
}
