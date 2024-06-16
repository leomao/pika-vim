local function fzf_config()
  local actions = require("fzf-lua.actions")
  local fzf = require("fzf-lua")
  fzf.setup({
    fzf_bin = "fzf",
    actions = {
      files = {
        ["default"] = actions.file_edit,
      },
    },
  })
  fzf.register_ui_select()

  local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs)
  end

  map("<Leader>ff", fzf.files)
  map("<Leader>fb", fzf.buffers)
  map("<Leader>fg", fzf.grep)
  map("<Leader>fd", fzf.diagnostics_document)
end

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      -- optional for icon support
      "kyazdani42/nvim-web-devicons",
      --  { 'lotabout/skim', build = './install' }
      -- 'junegunn/fzf',
    },
    config = fzf_config,
    event = "VeryLazy",
  },
}
