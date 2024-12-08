local lsp_enabled_filetypes = {
  "c",
  "cpp",
  "objc",
  "objcpp",
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  "python",
  "tex",
  "bib",
  "rust",
  "lua",
}

local function lsp_on_attach(client, bufnr)
  require("lsp_signature").on_attach({}, bufnr)

  if vim.lsp.formatexpr then
    vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr", {
      buf = bufnr
    })
  end
  if vim.lsp.tagfunc then
    vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", {
      buf = bufnr
    })
  end

  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
  end

  local border_opts = { border = "rounded" }

  map("n", "<Localleader>D", vim.lsp.buf.declaration)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<Localleader>k", vim.lsp.buf.signature_help)
  map("n", "<Localleader>e", function()
    vim.diagnostic.open_float(border_opts)
  end)
  map("n", "<Localleader>R", vim.lsp.buf.rename)
  map("n", "[g", function()
    vim.diagnostic.goto_prev({ float = border_opts })
  end)
  map("n", "]g", function()
    vim.diagnostic.goto_next({ float = border_opts })
  end)
  map("n", "<Localleader>a", vim.lsp.buf.code_action)

  map("n", "<Localleader>d", vim.lsp.buf.definition)
  map("n", "<Localleader>i", vim.lsp.buf.implementation)
  map("n", "<Localleader>t", vim.lsp.buf.type_definition)
  map("n", "<Localleader>r", vim.lsp.buf.references)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    map("n", "<Localleader>F", vim.lsp.buf.formatting)
  end
  if client.server_capabilities.document_range_formatting then
    map("v", "<Localleader>F", vim.lsp.buf.range_formatting)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "Search" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { link = "Search" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "Search" })
    local group_id = vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group_id,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group_id,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    lsp_on_attach(client, bufnr)
  end
})

local function create_setup_config(base)
  if base == nil then
    base = {}
  end
  base.capabilities = require("cmp_nvim_lsp").default_capabilities()
  return base
end

local function lsp_config()
  local lspconfig = require("lspconfig")

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = { priority = 20 },
    underline = false,
    severity_sort = true,
  })

  local servers = { "clangd", "pyright", "texlab" }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(create_setup_config())
  end

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  lspconfig.lua_ls.setup(create_setup_config({
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = runtime_path },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  }))
end

return {
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
    event = "LspAttach",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = lsp_config,
    ft = lsp_enabled_filetypes,
  },
  {
    "simrat39/symbols-outline.nvim",
    init = function()
      vim.g.symbols_outline = { auto_preview = false }
    end,
    cmd = { "SymbolsOutline" },
  },
  -- Language specific packages
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  }
}
