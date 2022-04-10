local M = {}

M.default_options = {
  bufferline = true,
  fzf = true,
}

function M.setup(options)
  local opts = M.default_options
  if options ~= nil then
    opts = vim.tbl_extend("force", opts, options)
  end

  -- map leader
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  local noremap = require('pika.mappings.util').noremap
  local noresimap = require('pika.mappings.util').noresimap

  vim.opt.pastetoggle = '<F2>'
  -- Swap j <-> gj, k <-> gk. It is more intuitive when moving in long lines.
  noremap('n', 'j', 'gj')
  noremap('n', 'k', 'gk')
  noremap('n', 'gj', 'j')
  noremap('n', 'gk', 'k')
  -- Swap 0 <-> ^. 0 is easier to press while the original ^ is more useful.
  noremap('n', '0', '^')
  noremap('n', '^', '0')
  noremap('v', '0', '^')
  noremap('v', '^', '0')
  -- Make +/- be increasing/decreasing the number.
  noremap('n', '+', '<C-a>')
  noremap('n', '-', '<C-x>')
  -- Tmux uses <C-a>. Let's use <C-b> instead.
  noremap('i', '<C-b>', '<C-a>')
  -- Make window resizing easier.
  noremap('n', '<C-Right>', '<C-w>2>')
  noremap('n', '<C-Left>', '<C-w>2<')
  noremap('n', '<C-Up>', '<C-w>+')
  noremap('n', '<C-Down>', '<C-w>-')

  noresimap('n', '<Leader>/', '<Cmd>nohl<CR>')
  noresimap('n', '<Leader>w', '<Cmd>w!<CR>')
  noresimap('n', '<Leader>q', '<Cmd>bdelete<CR>')
  noresimap('n', '<Leader><Leader>', '<Cmd>b #<CR>')

  if opts.bufferline then
    noresimap('n', 'L', '<Cmd>BufferLineCycleNext<CR>')
    noresimap('n', 'H', '<Cmd>BufferLineCyclePrev<CR>')
    noresimap('n', '<Leader>L', '<Cmd>BufferLineMoveNext<CR>')
    noresimap('n', '<Leader>H', '<Cmd>BufferLineMovePrev<CR>')
  else
    noresimap('n', 'L', '<Cmd>bnext<CR>')
    noresimap('n', 'H', '<Cmd>bprev<CR>')
  end

  if opts.fzf then
    noresimap('n', '<Leader>ff', '<Cmd>Files<CR>')
    noresimap('n', '<Leader>fb', '<Cmd>Buffers<CR>')
    noresimap('n', '<Leader>fg', '<Cmd>Rg<CR>')
  end
end

return M
