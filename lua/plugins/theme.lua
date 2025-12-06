return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker",
    })
    require("onedark").load()
  end,
}


-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       contrast = "hard",
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
