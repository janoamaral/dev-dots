return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = 'Telescope',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "andrew-george/telescope-themes",
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        height = 0.65,
        width = 0.75,
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  },
}
