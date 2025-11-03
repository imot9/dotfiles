return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })

      -- LEADER+{1..9) to swap buffers
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
      end

      -- ALT+BACKSPACE to exit current buffer
      vim.keymap.set("n", "<A-BS>", "<Cmd>b# | bd #<CR>", { desc = "Buffer: Close Current File" })
    end,
  },
}
