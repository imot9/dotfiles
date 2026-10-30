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

      -- ALT+{1..9}: jump to visible buffer by position
      for i = 1, 9 do
        vim.keymap.set(
          "n",
          "<A-" .. i .. ">",
          "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
          { silent = true, desc = "Buffer: Go to " .. i }
        )
      end

      -- TAB / SHIFT+TAB: cycle through buffers
      vim.keymap.set(
        "n",
        "<Tab>",
        "<Cmd>BufferLineCycleNext<CR>",
        { silent = true, desc = "Buffer: Next" }
      )

      vim.keymap.set(
        "n",
        "<S-Tab>",
        "<Cmd>BufferLineCyclePrev<CR>",
        { silent = true, desc = "Buffer: Previous" }
      )

      -- ALT+q: close current buffer
      vim.keymap.set("n", "<A-q>", function()
        local current = vim.api.nvim_get_current_buf()

        -- Move to previous buffer in Bufferline's visible order
        vim.cmd("BufferLineCyclePrev")

        -- Delete the buffer we just left
        vim.api.nvim_buf_delete(current, { force = false })
      end, {
        silent = true,
        desc = "Buffer: Close Current File",
      })
    end
  },
}
