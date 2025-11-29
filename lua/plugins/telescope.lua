---------------------------------------------------------
--  TELESCOPE CONFIGURATION
---------------------------------------------------------

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })
    
    ---------------------------------------------------
    -- TELESCOPE KEYBINDINGS
    ---------------------------------------------------
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap.set
    
    -- Find files by name
    keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    -- Search text in files
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    -- Recent files
    keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    -- Search in current buffer
    keymap("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Buffer search" })
    -- Help tags
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    -- LSP symbols in current file
    keymap("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
    -- LSP diagnostics
    keymap("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
  end,
}
