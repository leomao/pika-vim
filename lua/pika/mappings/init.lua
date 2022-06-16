local M = {}

local map = vim.keymap.set

local function simap(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end
  opts.silent = true
  vim.keymap.set(mode, lhs, rhs, opts)
end

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

  vim.opt.pastetoggle = '<F2>'
  -- Swap j <-> gj, k <-> gk. It is more intuitive when moving in long lines.
  map('n', 'j', 'gj')
  map('n', 'k', 'gk')
  map('n', 'gj', 'j')
  map('n', 'gk', 'k')
  -- Swap 0 <-> ^. 0 is easier to press while the original ^ is more useful.
  map('n', '0', '^')
  map('n', '^', '0')
  map('v', '0', '^')
  map('v', '^', '0')
  -- Make +/- be increasing/decreasing the number.
  map('n', '+', '<C-a>')
  map('n', '-', '<C-x>')
  -- Tmux uses <C-a>. Let's use <C-b> instead.
  map('i', '<C-b>', '<C-a>')
  -- Make window resizing easier.
  map('n', '<C-Right>', '<C-w>2>')
  map('n', '<C-Left>', '<C-w>2<')
  map('n', '<C-Up>', '<C-w>+')
  map('n', '<C-Down>', '<C-w>-')

  simap('n', '<Leader>/', '<Cmd>nohl<CR>')
  simap('n', '<Leader>w', '<Cmd>w!<CR>')
  simap('n', '<Leader>q', '<Cmd>bdelete<CR>')
  simap('n', '<Leader><Leader>', '<Cmd>b #<CR>')

  if opts.bufferline then
    simap('n', 'L', '<Cmd>BufferLineCycleNext<CR>')
    simap('n', 'H', '<Cmd>BufferLineCyclePrev<CR>')
    simap('n', '<Leader>L', '<Cmd>BufferLineMoveNext<CR>')
    simap('n', '<Leader>H', '<Cmd>BufferLineMovePrev<CR>')
  else
    simap('n', 'L', '<Cmd>bnext<CR>')
    simap('n', 'H', '<Cmd>bprev<CR>')
  end

  if opts.fzf then
    simap('n', '<Leader>ff', '<Cmd>FzfLua files<CR>')
    simap('n', '<Leader>fb', '<Cmd>FzfLua buffers<CR>')
    simap('n', '<Leader>fg', '<Cmd>FzfLua grep<CR>')
  end
end

return M
