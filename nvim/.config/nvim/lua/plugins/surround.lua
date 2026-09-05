return {
  "kylechui/nvim-surround",
  version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = {
    keymaps = {
      normal = ",sa", -- Add surrounding in normal mode
      delete = ",sd", -- Delete surrounding in normal mode
    }
  }
}
