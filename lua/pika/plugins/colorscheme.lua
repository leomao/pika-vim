return {
  -- 'rktjmp/lush.nvim',
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        colors = {
          git_add = "require('onedarkpro.helpers').darken('green', 15)",
          git_change = "require('onedarkpro.helpers').darken('yellow', 10)",
          git_delete = "require('onedarkpro.helpers').darken('red', 15)",
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },
}
