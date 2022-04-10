local M = {}

function M.noremap(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end
  opts.noremap = true
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function M.noresimap(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end
  opts.noremap = true
  opts.silent = true
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
