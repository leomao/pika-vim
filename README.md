# pika-nvim

Version: 0.6.0

My neovim configuration. It is only tested in my own environments.

## How to Use

### Dependencies

- Latest [neovim][neovim] 0.12.0+.
- [rg](https://github.com/BurntSushi/ripgrep)
- Dependencies of [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- Dependencies of [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Optional Dependencies

These are needed if you want to use all features.

- g++/clang (for compile c++ programs)
  - clangd provides LSP support.
- (xe)latex compiler (for latex usage)
- rust (and rust\_analyzer)
- ty, ruff (Python LSP)
- typescript-language-server

### Deploy
To use this configuration, run following commands:
```console
$ git clone --depth=1 -b neovim https://github.com/leomao/pika-vim.git
$ ln -sr pika-vim ~/.config/nvim
```

### Update Plugins
Execute `:Lazy sync`. See [lazy.nvim][lazy.nvim] for more details.

## Common Shortcut

Currently both `<Leader>` and `<LocalLeader>` are `<space>`.

### General
- Save file `<Leader>w`
- next buffer `L`
- previous buffer `H`
- close buffer `<Leader>q`
- `:nohl` `<Leader>/`

### Comment
See https://neovim.io/doc/user/various/#commenting

### vimtex
- Compile `<Leader>ll`
- View `<Leader>lv`
- View error `<Leader>le`
- set main file: add `%! TEX root=MAINFILE_RELATIVEPATH` at the top of your file
- you may want to add
```
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
```
in  `~/.latexmkrc`.

### LSP
TBD

## Acknowledgement

This configuration borrowed lots of things from
https://github.com/chmnchiang/vim.

[neovim]: https://github.com/neovim/neovim
[lazy.nvim]: https://github.com/folke/lazy.nvim
