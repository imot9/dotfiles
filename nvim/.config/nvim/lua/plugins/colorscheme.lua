  return {
   "uZer/pywal16.nvim",
    config = function()
      local pywal = vim.fn.expand("~/.cache/wal/colors-wal.vim")
      if vim.fn.filereadable(pywal) == 1 then
        require("pywal16").setup()
      else
        require("colors.fallback").setup()
      end
    end,
  }

