return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  -- make sure treesitter is up and running,
  -- and load after content is read
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      injected_languages = true,
      highlight = { "Function", "Label" },
      priority = 500,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a2a" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#3a3a3a" })
  end,
}
