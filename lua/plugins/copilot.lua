---------------------------------------------------------
--  GITHUB COPILOT CONFIGURATION
---------------------------------------------------------

return {
  "github/copilot.vim",
  config = function()
    -- Disable default Tab mapping
    vim.g.copilot_no_tab_map = true
    
    -- Accept suggestion with Ctrl+J
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion"
    })
    
    -- Navigate suggestions
    vim.keymap.set("i", "<C-L>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
    vim.keymap.set("i", "<C-H>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })
  end,
}
