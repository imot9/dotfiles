return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      vim.keymap.set("v", "<leader>fg", function()
        vim.cmd('normal! "zy')
        local text = vim.fn.getreg("z")
        text = text:gsub("\n", "")
        builtin.live_grep({ default_text = text })
      end, { noremap = true, silent = true })

      -- live grep with selected dirs
      vim.keymap.set("n", "<leader>fG", function()
        builtin.find_files({
          prompt_title = "Search in",
          find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local function choose_dir()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if not selection or not selection[1] then return end
              builtin.live_grep({ cwd = selection[1] })
            end

            map("i", "<CR>", choose_dir)
            map("n", "<CR>", choose_dir)
            return true
          end,
        })
      end, { desc = "Telescope: pick dir then live_grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
