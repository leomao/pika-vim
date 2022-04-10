local M = {}

function M.setup(use)
  use {
    'mhinz/vim-signify',
    config = function()
      vim.g.signify_sign_add = '│'
      vim.g.signify_sign_change = '│'
      vim.g.signify_priority = 5
    end
  }
end

return M
