return {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        style = "night",
        transparent = true,
        styles = {
            keywords = { italic = true, bold = true },
        }
    },
}
