pika-vim
========

Version: 2.8.0

My Pika vim configuration

Use [vim-plug](https://github.com/tpope/vim-pathogen) to manage plugins.

This configuration is not tested on Windows.

## How to use
Dependencies:

1. Vim 7.3+
3. Ctags
4. xelatex compiler
5. g++

To use this configuration, run following commands:
```bash
$ git clone https://github.com/leomao/pika-vim.git
$ cd pika-vim
$ ./deploy.py -h # check help (need python3)
$ ./deploy.py # deploy the configuration
```

### Update Plugins
- use `:PlugClean` to clean old plugins.
- use `:PlugUpdate` and `:PlugUpgrade` to update the plugins.

Included Plugins:
=======
* [Buffer Explorer](https://github.com/jlanzarotta/bufexplorer)
* [Emmet](https://github.com/mattn/emmet-vim)
* [html5.vim](https://github.com/othree/html5.vim)
* [NERD Commenter](https://github.com/scrooloose/nerdcommenter)
* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [OmnicppComplete](https://github.com/vim-scripts/OmniCppComplete)
* [python syntax](https://github.com/hdima/python-syntax)
* [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
* [Surround](https://github.com/tpope/vim-surround)
* [TagBar](https://github.com/majutsushi/tagbar)
* [undotree](https://github.com/mbbill/undotree)
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vimtex](https://github.com/lervag/vimtex)
* [vim-less](https://github.com/groenewege/vim-less.git)
* [Python pep8 indent](https://github.com/hynek/vim-python-pep8-indent)

Common Shortcut:
=======
General:
-------
+ Save file `<leader>w`
+ next buffer `<leader>bn`
+ previous buffer `<leader>bp`
+ close buffer `<leader>bd`
+ make `<F9>`
+ Quit `<C-d>` or `ZQ`

Programming Language:
-------
### C/C++
+ SingleCompile (let "make" compile single cpp file) `<C-F9>`

### Python
+ make python script executable `<C-F9>`

Plugin:
-------
### nerdcommenter
+ Toggle line Comment `<leader>c<space>`
+ add line Comment `<leader>cc`
+ remove line Comment `<leader>cu`

### bufexpl
+ open bufexpl `<leader>be`

### vim-latex
+ Compile `<leader>ll`
+ View `<leader>lv`
+ set main file: add `%! TEX root=MAINFILE_RELATIVEPATH` at the top of your file
+ you may want to add
```
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
```
in  `~/.latexmkrc`.

### NERDTree
+ Toggle NERDTree `<leader>nt`

### TagBar
+ Generate tags (ctags) `<F12>`
+ toggle TagBar `<leader>tb`

### Emmet
+ Emmet Prefix `<C-y>`

Customization:
=======
To change the leader key `<leader>`, create a file named `.vimrc_leader`
in the same directory of `.vimrc` and add following in the file:
```
" change your leader to ","
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","
```
Use your favorite key to substitute `,`.  

To change some plugins' settings or other things, create a file named
`.vimrc_custom` in the same directory of `.vimrc` and add what you need
in that file.
