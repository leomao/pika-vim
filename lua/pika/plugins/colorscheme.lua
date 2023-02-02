return {
  -- 'rktjmp/lush.nvim',
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").load()
    end,
  },
}
