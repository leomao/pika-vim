local M = {}

local last_readiness_check_time = nil
local last_readiness = false

function M.lsp_readiness()
  if next(vim.lsp.buf_get_clients(0)) == nil then
    return ''
  end
  local current_time = os.time()
  if last_readiness_check_time == nil or
      os.difftime(current_time, last_readiness_check_time) >= 5 then
    last_readiness = vim.lsp.buf.server_ready()
    last_readiness_check_time = current_time
  end
  return 'LSP ' .. (last_readiness and ' ' or '痢')
end

return M
