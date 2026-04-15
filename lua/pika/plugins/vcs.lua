return {
  {
    "algmyr/vcsigns.nvim",
    config = function()
      require("vcsigns").setup({
        target_commit = 1, -- Nice default for jj with new+squash flow.
        signs = {
          text = {
            add = "▎",
            change = "▎",
          },
        },
      })
    end,
  },
}
