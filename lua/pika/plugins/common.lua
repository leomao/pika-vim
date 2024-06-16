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
    main = "ibl",
    opts = {
      exclude = {
        buftypes = { "terminal", "help" },
      }
    },
  },
}
