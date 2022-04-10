local M = {}

function M.setup(use)
  -- Colorscheme
  -- use 'rktjmp/lush.nvim'
  use {
    'olimorris/onedarkpro.nvim',
    config = function()
      require('onedarkpro').load()
    end
  }
end

return M
