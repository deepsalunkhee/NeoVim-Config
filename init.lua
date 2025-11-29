---------------------------------------------------------
--  BASIC SETTINGS
---------------------------------------------------------

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- Explorer shortcut
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { silent = true, noremap = true })
---------------------------------------------------------
--  LAZY.NVIM BOOTSTRAP
---------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
---------------------------------------------------------
--  PLUGINS
---------------------------------------------------------
require("lazy").setup({
  -------------------------------------------------------
  -- LSP / Mason
  -------------------------------------------------------
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",   -- lua lsp   
          "clangd",   -- C/C++
	  "html",        -- HTML
          "cssls",       -- CSS
          "jdtls",    -- Java
          "ts_ls",    -- TypeScript/Angular
        },
        automatic_installation = false,  -- Manual for now
      })
      ---------------------------------------------------
      -- NEOVIM 0.11 LSP CONFIG API
      ---------------------------------------------------
      -- Lua LSP (this should work out of the box)
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          }
        }
      }
      vim.lsp.enable("lua_ls")


      vim.lsp.config.html = {}
      vim.lsp.enable("html")

      vim.lsp.config.cssls = {}
      vim.lsp.enable("cssls")
      
      -- Uncomment these after installing system dependencies:
	vim.lsp.config.clangd = {}
      vim.lsp.enable("clangd")
      
       vim.lsp.config.jdtls = {}
       vim.lsp.enable("jdtls")
      
       vim.lsp.config.ts_ls = {}
       vim.lsp.enable("ts_ls")
    end,
  },
  -------------------------------------------------------
  -- Treesitter (syntax highlighting)
  -------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "c",
          "cpp",
          "java",
          "javascript",
          "typescript",
          "html",
          "css",
        },
        highlight = { enable = true },
      })
    end,
  },

   -------------------------------------------------------
  -- Telescope (Fuzzy Finder)
  -------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        }
      })
    end,
  },

  -------------------------------------------------------
  -- GitHub Copilot
  -------------------------------------------------------
  {
    "github/copilot.vim",
    config = function()
      -- Accept suggestion with Tab
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      -- Navigate suggestions
      vim.keymap.set("i", "<C-L>", "<Plug>(copilot-next)")
      vim.keymap.set("i", "<C-H>", "<Plug>(copilot-previous)")
      vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)")
    end,
  },
  -------------------------------------------------------
  -- Autocomplete
  -------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },
})
---------------------------------------------------------
--  LSP KEYBINDINGS
---------------------------------------------------------
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)


---------------------------------------------------------
--  TELESCOPE KEYBINDINGS
---------------------------------------------------------
local builtin = require("telescope.builtin")
-- Find files by name
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
-- Search text in files (requires ripgrep: sudo apt install ripgrep)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
-- Recent files
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
-- Search in current buffer
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Buffer search" })
-- Help tags
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
-- LSP symbols in current file
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
-- LSP diagnostics
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
