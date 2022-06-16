local M = {}

local function fzf_config()
  local actions = require('fzf-lua.actions')
  local fzf = require('fzf-lua')
  fzf.setup({
    fzf_bin = 'sk',
    actions = {
      files = {
        ["default"] = actions.file_edit,
      },
    },
  })
  fzf.register_ui_select()
end

function M.setup(use)
  local sk_plugin = { 'lotabout/skim' }
  if not vim.fn.executable('sk') then
    sk_plugin.run = './install'
  end

  use(sk_plugin)

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = {
      'kyazdani42/nvim-web-devicons',
      -- 'junegunn/fzf',
    },
    config = fzf_config,
  }

end

return M
