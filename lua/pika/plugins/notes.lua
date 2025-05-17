return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "fzf_lua",
    })
  end,
  ft = { "markdown" },
}
