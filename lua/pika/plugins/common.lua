return {
  { "ntpeters/vim-better-whitespace", event = "BufEnter" },
  { "kylechui/nvim-surround", event = "BufEnter" },
  { "tpope/vim-abolish", event = "BufEnter" },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = true,
    opts = {
      buftype_exclude = { "terminal", "help" },
      show_first_indent_level = false,
    },
  },
  {
    "ojroques/vim-oscyank",
    cmd = "OSCYankReg",
    init = function()
      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          local event = vim.v.event
          if event == nil then
            return
          end
          -- Use OSC52 when + register is used
          if event.operator == "y" and event.regname == "+" then
            vim.cmd("OSCYankReg +")
          end
        end,
      })
    end,
  },
}
