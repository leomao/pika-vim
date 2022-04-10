local M = {}

function M.setup(use)
  use { 'rust-lang/rust.vim', ft = 'rust' }
  use { 'lervag/vimtex', ft = 'tex' }
end

return M
