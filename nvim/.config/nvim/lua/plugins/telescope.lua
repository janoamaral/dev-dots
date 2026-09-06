return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "fdschmidt93/telescope-egrepify.nvim",
        "andrew-george/telescope-themes",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = function()
        local themes = require("telescope.themes")
        return {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    height = 0.65,
                    width = 0.75,
                },
            },
            extensions = {
                ["ui-select"] = {
                    themes.get_dropdown({}),
                },
            },
        }
    end
}
