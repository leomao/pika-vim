vim.autoread = true -- Trigger autoread when files change on disk

local opt = vim.opt

opt.background = "dark"
opt.termguicolors = true

opt.confirm = true

opt.mouse = "a"
opt.termguicolors = true -- True color support
opt.hidden = true -- Enable background buffers

opt.smartcase = true -- Do not ignore case with capitals
opt.ignorecase = true -- Ignore case
opt.hlsearch = true
opt.incsearch = true

opt.joinspaces = false -- No double spaces with join
opt.list = true -- Show some invisible characters

opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.colorcolumn = "+1" -- Show textwidth column
opt.ruler = true

opt.encoding = "utf8"
opt.fileencoding = "utf8"

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.textwidth = 80

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2 -- Number of spaces tabs count for
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent

opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

opt.wrap = false -- Disable line wrap
opt.wildmode = "full" -- Command-line completion mode
opt.wildignorecase = true
opt.wildmenu = true
opt.wildignore = "*.o,*.obj,*~,*.synctex.gz,*.pdf"

opt.updatetime = 100
opt.timeoutlen = 300
opt.ttimeoutlen = 20

opt.showmode = false
opt.showcmd = true

opt.foldenable = true
opt.foldmethod = "marker"

-- Remove the annoying preview window
opt.completeopt:remove("preview")
opt.pumheight = 15

opt.inccommand = "nosplit" -- Incremental replace with preview

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
