return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",

    -- make sure lua LSP is installed
    opts = { ensure_installed = { "lua_ls" } },
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local blink = require("blink.cmp").get_lsp_capabilities()
      local telescope = require("telescope.builtin")

      -- fix lua_ls to not complain about undefined vim...
      vim.lsp.config("lua_ls", {
        capabilities = blink,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- keymaps
      vim.keymap.set("n", "<leader>gr", telescope.lsp_references, { desc = "LSP: References" })
      vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, { desc = "LSP: Definitions" })
      vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, { desc = "LSP: Implementations" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })

      vim.keymap.set("n", "<leader>gl", function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
      end, { desc = "Diagnostics: Line" })

      vim.keymap.set("n", "<leader>gL", function()
        telescope.diagnostics({ bufnr = 0 })
      end, { desc = "Diagnostics: File" })

      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
      vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { desc = "LSP: Hover" })

      -- make formatting async
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "LSP: Format" })
    end,
  },
}
