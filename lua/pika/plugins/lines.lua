local M = {}

local function bufferline_config()
  require('bufferline').setup {
    options = {
      separator_style = 'thick',
      show_buffer_close_icons = false,
      diagnostics = 'nvim_lsp',
    },
  }
end

local function lualine_config()
  require('lualine').setup {
    options = {theme = 'onedark'},
    sections = {
      lualine_b = {
        require('pika.util').lsp_readiness,
        'diagnostics',
      },
      lualine_c = {
        { 'filename', path = 1 }
      },
      lualine_x = {
        'branch',
        {
          'signify_diff',
          symbols = {added = '+', modified = '~', removed = '-'}
        },
      },
      lualine_y = {'encoding', 'fileformat', 'filetype'},
      lualine_z = {'progress'},
    },
    extensions = {
      'quickfix', 'symbols-outline',
    },
  }
end

function M.setup(use)
  use {
    'akinsho/bufferline.nvim',
    -- after = 'colorscheme',
    requires = 'kyazdani42/nvim-web-devicons',
    config = bufferline_config,
  }
  use {
    'hoob3rt/lualine.nvim',
    after = {'lualine-signify-diff'},
    requires = 'kyazdani42/nvim-web-devicons',
    config = lualine_config,
  }
  use {'chmnchiang/lualine-signify-diff', requires = 'mhinz/vim-signify'}
end

return M
