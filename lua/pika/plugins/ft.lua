local M = {}

function M.setup(use)
  use { 'vim-python/python-syntax', ft = 'python' }
  use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }
  use { 'rust-lang/rust.vim', ft = 'rust' }
  use { 'lervag/vimtex', ft = 'tex' }
end

return M
