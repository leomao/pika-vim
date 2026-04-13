return {
  { "ntpeters/vim-better-whitespace", event = "VeryLazy" },
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
  { "johmsalas/text-case.nvim", event = "VeryLazy", opts = {} },
  { "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },
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
