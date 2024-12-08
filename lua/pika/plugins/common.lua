return {
  { "ntpeters/vim-better-whitespace", event = "VeryLazy" },
  { "tpope/vim-abolish", event = "VeryLazy" },
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      exclude = {
        filetypes = { "help", "man" },
        buftypes = { "terminal" },
      },
    },
  },
}
