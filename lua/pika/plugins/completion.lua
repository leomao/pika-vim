local M = {}

local function nvim_cmp_config()
  local cmp = require('cmp')
  local has_lspkind, lspkind = pcall(require, 'lspkind')

  local lspkind_format = nil
  if has_lspkind then
    lspkind_format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
      },
    }
    vim.cmd [[highlight CmpItemAbbr guifg=#b0b0b0]]
  end

  local format = function(entry, vim_item)
    local function trim(s, max_len)
      if string.len(s) <= max_len then
        return s
      else
        return string.sub(s, 1, max_len - 1) .. '…'
      end
    end

    vim_item.abbr = trim(vim_item.abbr, 80)
    if has_lspkind then
      return lspkind_format(entry, vim_item)
    else
      return vim_item
    end
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'snippy' },
    },
    formatting = { format = format },
  }
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
  })
end

function M.setup(use)
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'onsails/lspkind-nvim' },
    config = nvim_cmp_config,
    event = { 'InsertEnter', 'CmdlineEnter' },
  }
  use { 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
  use {
    'dcampos/cmp-snippy',
    requires = { 'dcampos/nvim-snippy' },
    after = 'nvim-cmp',
  }
end

return M
