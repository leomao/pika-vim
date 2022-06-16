local function setup_vim_settings()
  vim.opt.mouse = 'a'
  vim.opt.termguicolors = true        -- True color support
  vim.opt.hidden = true               -- Enable background buffers

  vim.opt.smartcase = true            -- Do not ignore case with capitals
  vim.opt.ignorecase = true           -- Ignore case

  vim.opt.joinspaces = false          -- No double spaces with join
  vim.opt.list = true                 -- Show some invisible characters

  vim.opt.number = true               -- Show line numbers
  vim.opt.relativenumber = true       -- Relative line numbers
  vim.opt.signcolumn = 'yes'          -- Always show sign column
  vim.opt.colorcolumn = '+1'          -- Show textwidth column
  vim.opt.ruler = true

  vim.opt.encoding = 'utf8'
  vim.opt.fileencoding = 'utf8'

  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.swapfile = false

  vim.opt.textwidth = 80

  vim.opt.expandtab = true            -- Use spaces instead of tabs
  vim.opt.shiftwidth = 2              -- Size of an indent
  vim.opt.tabstop = 2                 -- Number of spaces tabs count for
  vim.opt.softtabstop = 2                 -- Number of spaces tabs count for
  vim.opt.smartindent = true          -- Insert indents automatically
  vim.opt.shiftround = true           -- Round indent

  vim.opt.scrolloff = 4               -- Lines of context
  vim.opt.sidescrolloff = 8           -- Columns of context

  vim.opt.splitbelow = true           -- Put new windows below current
  vim.opt.splitright = true           -- Put new windows right of current

  vim.opt.wrap = false                -- Disable line wrap
  vim.opt.wildmode = 'full'           -- Command-line completion mode
  vim.opt.wildignorecase = true
  vim.opt.wildmenu = true
  vim.opt.wildignore = '*.o,*.obj,*~,*.synctex.gz,*.pdf'

  vim.opt.updatetime = 100
  vim.opt.timeoutlen = 300
  vim.opt.ttimeoutlen = 20

  vim.opt.showmode = false
  vim.opt.showcmd = true

  -- Disable conceal (some plugin might set it, force it to be 0)
  vim.opt.conceallevel = 0

  vim.opt.foldenable = true
  vim.opt.foldmethod = 'marker'
  -- Remove the annoying preview window
  vim.opt.completeopt:remove('preview')
  vim.opt.pumheight = 15

  -- Incremental replace with preview
  vim.opt.inccommand = 'nosplit'
end

local function setup()
  vim.opt.background = 'dark'
  vim.opt.termguicolors = true
  require('pika.plugins').setup()
  require('pika.mappings').setup()
  require('pika.autocmd').setup()
  setup_vim_settings()
end

setup()
