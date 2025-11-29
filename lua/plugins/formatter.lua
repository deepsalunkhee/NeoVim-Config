---------------------------------------------------------
--  CODE FORMATTER CONFIGURATION
---------------------------------------------------------

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    
    conform.setup({
      formatters_by_ft = {
        -- Web Development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        
        -- Systems Programming
        c = { "clang-format" },
        cpp = { "clang-format" },
        
        -- Java
        java = { "google-java-format" },
        
        -- Lua
        lua = { "stylua" },
        
      },
      
      -- Format on save
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
    
    ---------------------------------------------------
    -- FORMATTER KEYBINDINGS
    ---------------------------------------------------
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })
  end,
}
