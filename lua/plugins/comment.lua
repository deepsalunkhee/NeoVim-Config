---------------------------------------------------------
--  COMMENT PLUGIN
---------------------------------------------------------

return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      -- Add a space between comment and line
      padding = true,
      -- Should comment out empty lines
      sticky = true,
      -- Ignore empty lines
      ignore = "^$",

      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "gcc",  -- Line-comment toggle
        block = "gbc", -- Block-comment toggle
      },

      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc",  -- Line-comment operator
        block = "gb", -- Block-comment operator
      },

      -- LHS of extra mappings
      extra = {
        above = "gcO", -- Add comment on line above
        below = "gco", -- Add comment on line below
        eol = "gcA",   -- Add comment at end of line
      },
    })
  end,
}

--[[
USAGE:

Normal Mode (single line):
  gcc - Toggle comment on current line
  gbc - Toggle block comment

Normal Mode (multiple lines):
  gc5j - Comment next 5 lines
  gc5k - Comment previous 5 lines
  gcap - Comment paragraph
  gc} - Comment to end of block

Visual Mode:
  1. Select lines with V (visual line mode)
  2. Press gc to toggle comment
  3. Or use gb for block comment

Shortcuts:
  gcO - Add comment line above cursor
  gco - Add comment line below cursor
  gcA - Add comment at end of current line

Examples:
  - Select 5 lines with V then jjjj
  - Press gc
  - Lines are commented!
  - Press gc again to uncomment
]]
