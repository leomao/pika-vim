local M = {}

M.lsp_enabled_filetypes = {
  'c', 'cpp', 'objc', 'objcpp', 'javascript', 'javascriptreact',
  'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'python',
  'tex', 'bib', 'rust', 'lua',
}

function M.lsp_on_attach(client, bufnr)
  require('lsp_signature').on_attach({}, bufnr)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  if vim.lsp.formatexpr then
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")
  end
  if vim.lsp.tagfunc then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', '<Localleader>D',
      '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'K',
      '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Localleader>k',
      '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Localleader>e',
      '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<Localleader>R',
      '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[g',
      '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g',
      '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Localleader>a',
      '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<Localleader>a',
      '<Cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  buf_set_keymap('n', '<Localleader>d',
      '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Localleader>i',
      '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Localleader>t',
      '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Localleader>r',
      '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap('n', '<Localleader>f',
        '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
  if client.server_capabilities.document_range_formatting then
    buf_set_keymap('v', '<Localleader>f',
        '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi link LspReferenceRead Search
      hi link LspReferenceText Search
      hi link LspReferenceWrite Search
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]], false)
  end
end

function M.get_base_config()
  return {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = require('pika.plugins.lsp').lsp_on_attach,
  }
end

local function lsp_config()
  local nvim_lsp = require('lspconfig')
  local get_base_config = require('pika.plugins.lsp').get_base_config

  vim.lsp.handlers['textDocument/publishDiagnostics'] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = {priority = 20},
        underline = false,
        severity_sort = true,
      })

  -- clangd will be set up by clangd_extensions.
  -- rust_analyzer will be set up by rust-tools.
  local servers = {'pyright', 'texlab'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(get_base_config())
  end

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  nvim_lsp['sumneko_lua'].setup(vim.tbl_extend('force', get_base_config(), {
    cmd = {'lua-language-server'},
    settings = {
      Lua = {
        runtime = {version = 'LuaJIT', path = runtime_path},
        diagnostics = {globals = {'vim'}},
        workspace = {library = vim.api.nvim_get_runtime_file('', true)},
        telemetry = {enable = false},
      },
    },
  }))
end

local function clangd_config()
  require('clangd_extensions').setup {
    server = require('pika.plugins.lsp').get_base_config()
  }
end

local function rust_config()
  require('rust-tools').setup(require('pika.plugins.lsp').get_base_config())
end

function M.setup(use)
  use {
    'neovim/nvim-lspconfig',
    requires = {'hrsh7th/cmp-nvim-lsp'},
    config = lsp_config,
    ft = M.lsp_enabled_filetypes,
  }
  use {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
  }
  use {
    'simrat39/symbols-outline.nvim',
    setup = function()
      vim.g.symbols_outline = {auto_preview = false}
    end,
    cmd = {'SymbolsOutline'},
  }

  -- Language specific packages
  use {
    'p00f/clangd_extensions.nvim',
    requires = 'neovim/nvim-lspconfig',
    after = 'nvim-lspconfig',
    config = clangd_config,
    ft = { 'c', 'cpp' }
  }

  use {
    'simrat39/rust-tools.nvim',
    requires = 'neovim/nvim-lspconfig',
    after = 'nvim-lspconfig',
    config = rust_config,
    ft = { 'rust' }
  }
end

return M
