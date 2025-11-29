---------------------------------------------------------
--  LSP CONFIGURATION
---------------------------------------------------------

return {
  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "html",   -- HTML
          "cssls",  -- CSS
          "clangd", -- C/C++
          "ts_ls",  -- TypeScript/Angular
          "jdtls",  -- Java
        },
        automatic_installation = false,
      })

      ---------------------------------------------------
      -- NEOVIM 0.11 LSP CONFIG API
      ---------------------------------------------------
      -- Lua LSP
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          }
        }
      }
      vim.lsp.enable("lua_ls")

      -- HTML
      vim.lsp.config.html = {}
      vim.lsp.enable("html")

      -- CSS
      vim.lsp.config.cssls = {}
      vim.lsp.enable("cssls")

      vim.lsp.config.clangd = {}
      vim.lsp.enable("clangd")


      vim.lsp.config.ts_ls = {}
      vim.lsp.enable("ts_ls")

      vim.lsp.config.jdtls = {}
      vim.lsp.enable("jdtls")

      ---------------------------------------------------
      -- LSP KEYBINDINGS
      ---------------------------------------------------
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end,
  },
}
