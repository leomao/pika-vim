local M = {}

function M.setup()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  local packer_bootstrap = false
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
  end

  return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    require('pika.plugins.colorscheme').setup(use)
    require('pika.plugins.common').setup(use)
    require('pika.plugins.ft').setup(use)
    require('pika.plugins.lsp').setup(use)
    require('pika.plugins.completion').setup(use)
    require('pika.plugins.picker').setup(use)
    require('pika.plugins.vcs').setup(use)
    require('pika.plugins.lines').setup(use)

    if packer_bootstrap then
      require('packer').sync()
    end

  end)
end

return M
