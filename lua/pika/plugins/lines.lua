local function bufferline_config()
  require("bufferline").setup({
    options = {
      separator_style = "thick",
      show_buffer_close_icons = false,
      diagnostics = "nvim_lsp",
    },
  })
end

local function lualine_config()
  require("lualine").setup({
    options = { theme = "onedark" },
    sections = {
      lualine_b = {
        "diagnostics",
      },
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = {
        "branch",
        {
          "signify_diff",
          symbols = { added = "+", modified = "~", removed = "-" },
        },
      },
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "progress" },
    },
    extensions = {
      "quickfix",
      "symbols-outline",
    },
  })
end

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = bufferline_config,
  },
  {
    "hoob3rt/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      {
        "chmnchiang/lualine-signify-diff",
        dependencies = { "mhinz/vim-signify" },
      },
    },
    config = lualine_config,
  },
}
