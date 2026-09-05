return {
  { "MunifTanjim/nui.nvim" },
  { "stevearc/dressing.nvim" },
  {
    "Fildo7525/pretty_hover",
    lazy = true,
    opts = {
      border = "rounded",
      max_width = 80,
      max_height = 20,
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    }
  },
}
