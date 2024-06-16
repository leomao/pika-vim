local buf_get_option = function(buf, name)
  return vim.api.nvim_get_option_value(name, { buf = buf })
end

local function has_ignore_buftype(buf)
  local ignore_bts = { "quickfix", "nofile", "help" }
  local bt = buf_get_option(buf, "buftype")
  return vim.tbl_contains(ignore_bts, bt)
end

local function has_ignore_filetype(buf)
  local ft = buf_get_option(buf, "filetype")
  if vim.endswith(ft, "commit") or vim.endswith(ft, "rebase") then
    return true
  end
  return false
end

local group_id = vim.api.nvim_create_augroup("pika_group", {})

-- Restore the cursor to the line when reopen a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group_id,
  pattern = "*",
  callback = function(args)
    local buf = args.buf

    if has_ignore_buftype(buf) or has_ignore_filetype(buf) then
      return
    end

    local pos = vim.api.nvim_buf_get_mark(buf, '"')[1]
    local line_count = vim.api.nvim_buf_line_count(buf)
    if pos > 1 and pos <= line_count then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Open :help vertically
vim.api.nvim_create_autocmd("BufEnter", {
  group = group_id,
  pattern = "*.txt",
  callback = function(args)
    if buf_get_option(args.buf, "buftype") == "help" then
      vim.cmd([[wincmd L]])
    end
  end,
})
