# pika-nvim

Version: 0.1.0

My neovim configuration

This configuration is only tested on my own environments.

## How to Use

### Dependencies

- Latest [neovim][neovim] 0.6.0+.

### Optional Dependencies

These are needed if you want to use all features.

- g++/clang (for compile c++ programs)
  - clangd provides LSP support.
- [rg](https://github.com/BurntSushi/ripgrep)
  (see [fzf.vim](https://github.com/junegunn/fzf.vim))
- (xe)latex compiler (for latex usage)
- rust (and rust\_analyzer)
- pyright

### Deploy
To use this configuration, run following commands:
```console
$ git clone --depth=1 -b neovim https://github.com/leomao/pika-vim.git
$ ln -sr pika-vim ~/.config/nvim
```

### Update Plugins
Execute `:PackerSync`. See [packer.nvim][packer.nvim] for more details.

## Common Shortcut

Currently both `<Leader>` and `<LocalLeader>` are `<space>`.

### General
- Save file `<Leader>w`
- next buffer `L`
- previous buffer `H`
- close buffer `<Leader>q`
- `:nohl` `<Leader>/`
- Toggle paste mode `<F2>`

### Comment
See [Comment.nvim](https://github.com/numToStr/Comment.nvim)

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
[packer.nvim]: https://github.com/wbthomason/packer.nvim
