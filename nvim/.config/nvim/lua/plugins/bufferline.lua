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
              separator = true
            }
          }
        }
      })

    for i = 1, 9 do
      vim.keymap.set("n", "<A-" .. i .. ">", ":BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
    end

    vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { silent = true })
    end,
  }
}
