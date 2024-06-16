local treesitter_langs = {
  "c", "cpp", "python", "rust", "lua", "vim", "vimdoc",
  "javascript", "html", "css", "scss",
  "markdown", "markdown_inline",
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = treesitter_langs,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
