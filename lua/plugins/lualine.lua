return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup({
      options = {
        theme = "onedark",
        icons_enabled = false,
        component_separators = "",
        section_separators = "",
      },

      sections = {
        lualine_a = { "mode" },

        lualine_b = {
          {
            "branch",
            fmt = function(str)
              return (str or "")
            end
          },
          "diff",
          "diagnostics"
        },

        lualine_c = { "filename" },

        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
