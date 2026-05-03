return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local config = require("nvim-treesitter")
    config.setup({
      auto_install = true,
    })
  end,
}
