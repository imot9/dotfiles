return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
      vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

      require("neo-tree").setup({
        window = {
          mappings = {
            ["h"] = "", -- Unbind 'h'
            ["j"] = "move_cursor_left", -- Remap 'j' to move left
            ["k"] = "move_cursor_down", -- Remap 'k' to move down
            ["l"] = "move_cursor_up", -- Remap 'l' to move up
            [";"] = "move_cursor_right", -- Remap ';' to move right
          },
        },
      })
    end,
  },
}
