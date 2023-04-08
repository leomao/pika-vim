return {
  { "ntpeters/vim-better-whitespace", event = "VeryLazy" },
  { "kylechui/nvim-surround", event = "VeryLazy" },
  { "tpope/vim-abolish", event = "VeryLazy" },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      buftype_exclude = { "terminal", "help" },
      show_first_indent_level = false,
    },
  },
  {
    "ojroques/nvim-osc52",
    init = function()
      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          -- Use OSC52 when + register is used
          if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
            require("osc52").copy_register("+")
          end
        end,
      })
    end,
  },
}
