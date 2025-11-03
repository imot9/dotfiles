return {
  {
    "Saghen/blink.cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("blink.cmp").setup({
        fuzzy = { implementation = "prefer_rust_with_warning" },

        keymap = {
          preset = "default",
          ["<C-Space>"] = { "show" },
          ["<CR>"] = { "accept", "fallback" },
          ["<Tab>"] = { "accept", "fallback" },
          ["<C-e>"] = { "cancel" },
        },

        sources = {
          default = { "lsp" },
        },

        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          }
        },

        -- optional
        -- signature = { enabled = true }
      })

    end,
  },
}
