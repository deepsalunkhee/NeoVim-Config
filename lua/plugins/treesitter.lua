---------------------------------------------------------
--  TREESITTER CONFIGURATION
---------------------------------------------------------

return {
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
        "json",
        "markdown",
      },
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
