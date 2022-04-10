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
$ git clone --depth=1 https://github.com/leomao/pika-vim.git
$ cd pika-vim
$ git checkout neovim
$ ln -sr $(pwd) ~/.config/nvim
```

### Update Plugins
Execute `:PackerSync`. See [packer.nvim][packer.nvim] for more details.

## Common Shortcut
### General
- Save file `<Leader>w`
- next buffer `L`
- previous buffer `H`
- close buffer `<Leader>q`
- `:nohl` `<Leader>/`
- Toggle paste mode `<F2>`

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

## Acknowledgement

This configuration borrowed lots of things from
https://github.com/chmnchiang/vim.

[neovim]: https://github.com/neovim/neovim
[packer.nvim]: https://github.com/wbthomason/packer.nvim
