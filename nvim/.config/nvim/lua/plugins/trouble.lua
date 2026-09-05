return {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup({
      auto_open = false,
      auto_close = true,
      auto_preview = false,
      auto_fold = false,
      severity = vim.diagnostic.severity.ERROR,
      use_diagnostic_signs = true,
    })
  end,
}
