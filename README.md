# pika-vim

Version: 5.4.0

My Pika vim configuration

Use [vim-plug][vim-plug] to manage plugins.

This configuration is only tested on my own environments.

## How to Use

### Dependencies

- Latest [neovim][neovim]. (or vim 8+)
  Notice that some features require neovim to work.
- python3 and python-neovim

### Optional Dependencies

These are needed if you want to use all features.

- g++ (for compile c++ programs)
- [ag (the\_silver\_searcher)](https://github.com/ggreer/the_silver_searcher)
  (see [fzf.vim](https://github.com/junegunn/fzf.vim))
- ctags (for tags generation)
- (xe)latex compiler (for latex usage)
- go (see the plugin `vim-go`)

### Deploy
To use this configuration, run following commands:
```console
$ git clone --depth=1 https://github.com/leomao/pika-vim.git
$ cd pika-vim
$ ./deploy.py -h # check help (need python3)
$ ./deploy.py # deploy the configuration
```

or deploy manually:
- neovim
```console
$ ln -sr pika-vim ~/.config/neovim
$ nvim +PlugInstall +qall
```
- vim
```console
$ ln -sr pika-vim ~/.vim
$ ln -sr ~/.vim/init.vim ~/.vimrc
$ vim +PlugInstall +qall
```

### Update Plugins
- use `:PlugClean` to clean old plugins.
- use `:PlugUpdate` to update the plugins.
- use `./cleanup.sh` to clean up the git history of plugins.

# Included Plugins:

## Colorscheme:
- [pikacode.vim](https://github.com/leomao/pikacode.vim)

## Plugins for filetypes:
- [Emmet](https://github.com/mattn/emmet-vim)
- [OmnicppComplete](https://github.com/vim-scripts/OmniCppComplete)
- [Python pep8 indent](https://github.com/hynek/vim-python-pep8-indent)
- [html5.vim](https://github.com/othree/html5.vim)
- [python syntax](https://github.com/leomao/python-syntax)
- [rust.vim](https://github.com/rust-lang/rust.vim)
- [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
- [vim-go](https://github.com/fatih/vim-go)
- [vim-javscript](https://github.com/pangloss/vim-javascript)
- [vim-jsx](https://github.com/mxw/vim-jsx)
- [vim-pug](https://github.com/digitaltoad/vim-pug)
- [vim-stylus](https://github.com/wavded/vim-stylus)
- [vimtex](https://github.com/lervag/vimtex)

## Plugins for general usage:
- [Buffer Explorer](https://github.com/jlanzarotta/bufexplorer)
- [Editorconfig](https://github.com/editorconfig/editorconfig-vim)
- [FZF](https://github.com/junegunn/fzf)
- [NERD Commenter](https://github.com/scrooloose/nerdcommenter)
- [TagBar](https://github.com/majutsushi/tagbar)
- [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [gv.vim](https://github.com/junegunn/gv.vim)
- [lightline-pika](https://github.com/leomao/lightline-pika)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-abolish](https://github.com/tpope/vim-abolish)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-tags](https://github.com/szw/vim-tags)
- [vim-vinegar](https://github.com/tpope/vim-vinegar)

# Common Shortcut
## General
- Save file `<leader>w`
- next buffer `<leader>bn`
- previous buffer `<leader>bp`
- close buffer `<leader>bd`
- `:nohl` `<leader>/`
- Toggle paste mode `<F2>`
- Toggle wrap mode `<F3>`
- Toggle QuickFix `<F8>`
- make `<F9>`
- Alternative escape `<C-e>` (tips: `<C-c>` is not equivalent to escape.)

## Programming Language
### C/C++
- SingleCompile (let "make" compile single cpp file) `<C-F9>`
- astyle formatting `<F10>` (need astyle installed)
- customization: (see [Customization](#customization))
```vim
" cpp ftplugin settings
let g:cpp_astyle_mapping = '<F6>'
let g:cpp_astyle_options = '-A8KpHUyk1qs2 -xG'
let g:cpp_compile_options = '-O2 -Wall -Wshadow'
```

### Python
- make python script executable `<C-F9>`

## Plugin:
### nerdcommenter
See [NERD Commenter](https://github.com/scrooloose/nerdcommenter)

### bufexpl
- open bufexpl `<leader>be`

### vimtex
- Compile `<leader>ll`
- View `<leader>lv`
- View error `<leader>le`
- set main file: add `%! TEX root=MAINFILE_RELATIVEPATH` at the top of your file
- you may want to add
```
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
```
in  `~/.latexmkrc`.

### TagBar
- toggle TagBar `<leader>tb`

### vim-tags
- Generate tags for the project (ctags) `:TagGenerate!`

### undotree
- toggle undotree panel `<F5>`

### Emmet
- Emmet Prefix `<C-y>`

### lightline pika
- To disable it:  
  add `let g:disable_lightline_pika = 1` to `local.vim`
- To disable the patch font:  
  add `unlet g:lightline_pika_patchfont` to `local.vim`
- To change the patch font:  
  add the following to `local.vim` (change the unicode to what you want):
```vim
let g:lightline_pika_patchfont = {
      \ 'leftsep': "\ue0b0",
      \ 'leftsubsep': "\ue0b1",
      \ 'rightsep': "\ue0b2",
      \ 'rightsubsep': "\ue0b3",
      \ 'branch': "\ue0a0",
      \ 'linecolumn': "\ue0a1",
      \ 'readonly': "\ue0a2",
      \ }
```

# Customization:

All customization files are put in the `custom` directory.
Please create a `custom` directory in this repo.

To change the leader key `<leader>`, create a file named `leader.vim` in
in `custom` and add the following to the file:
```vim
" change your leader to ','
let mapleader = ','
let maplocalleader = ','
let g:mapleader = ','
let g:maplocalleader = ','
```
Use your favorite key to substitute `,`.  

To add more plugins via vim-plug, create a file named `plugin.vim` in `custom`
and add something like following:
```vim
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
```
Please refer to [vim-plug][vim-plug] documentation.

To change settings of some plugins or other things, create a file named
`local.vim` in `custom` and add what you need in that file. For example,
to use other colorschemes, add the following to `local.vim`:
```vim
colorscheme desert
let g:lightline.colorscheme = 'wombat'
```
Combined with `plugin.vim`, you can use your favorite colorscheme!

For more detail, please refer to the docs of each plugin and the `init.vim`.

[neovim]: https://github.com/neovim/neovim
[vim-plug]: https://github.com/junegunn/vim-plug

# Known Issues:

- `<C-Fn>` doesn't work in neovim. See
  [neovim/neovim#4862](https://github.com/neovim/neovim/issues/4862#issuecomment-282988543) for a workaround.
