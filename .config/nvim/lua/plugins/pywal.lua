  return {
   "uZer/pywal16.nvim",
    config = function()
      require("pywal16").setup({
        theme = "default",
      })
    vim.api.nvim_set_hl(0, "String", { fg = "#c19a6b"})
    end,
  }

