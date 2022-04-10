local M = {}

function M.setup(use)
  -- Editing Utilities
  use {'tpope/vim-surround', event = 'BufEnter'}
  use {'tpope/vim-abolish', event = 'BufEnter'}
  use {'tpope/vim-repeat', event = 'BufEnter'}
  use {'ntpeters/vim-better-whitespace', event = 'BufEnter'}

  use {'editorconfig/editorconfig-vim', event = 'BufEnter'}

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    event = 'BufEnter',
  }

  -- indent line
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        buftype_exclude = {'terminal', 'help'},
        show_first_indent_level = false,
      })
    end,
    event = 'BufEnter',
  }

  use {
    'ojroques/vim-oscyank',
    config = function()
      -- Use OSC52 when + register is used
      vim.cmd [[autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg + | endif]]
    end,
    event = 'BufEnter',
  }

end

return M
