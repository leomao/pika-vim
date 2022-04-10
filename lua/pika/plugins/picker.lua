local M = {}

function M.setup(use)
  -- fuzzy search
  use {
    'junegunn/fzf.vim',
    requires = {
      {'junegunn/fzf'},
    },
  }
end

return M
