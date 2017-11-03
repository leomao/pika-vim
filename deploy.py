#! /usr/bin/env python3

import argparse
import os, os.path, sys, subprocess
import re
from pathlib import Path

parser = argparse.ArgumentParser(description='Deploy vim config files.')
subparsers = parser.add_subparsers(title='commands',
                                   dest='command')
deployp = subparsers.add_parser('deploy',
                                help='deploy the configuration.')
linkp = subparsers.add_parser('link',
                              help='link the configuration.')
updatep = subparsers.add_parser('update',
                                help='update the configuration.')
parser.add_argument('-k', '--keep', action='store_true',
                    help='keep old files (for deploy and link).')

FILE_PATH = os.path.dirname(os.path.realpath(__file__))
CMD_LN = 'ln -srfT {} {}'
if sys.platform == 'darwin':
    CMD_LN = 'ln -sf {} {}'

def run_cmd(cmd):
    subprocess.call([cmd], shell=True)

def check_path(targets, keep):
    if keep:
        cmd = 'mv {0} {0}.old'
    else:
        cmd = 'rm -rf {0}'
    for t in targets:
        if os.path.exists(os.path.expanduser(t)):
            run_cmd(cmd.format(t))

def task_link(maps, keep):
    targets = list(maps.values())
    check_path(targets, keep)

    for f, t in maps.items():
        run_cmd(CMD_LN.format(f, t))

def task_vim(keep):
    vimmap = {
        FILE_PATH: '~/.vim',
        '~/.vim/init.vim': '~/.vimrc',
    }
    task_link(vimmap, keep)

    # link nvim config
    vimmap = {
        FILE_PATH: '~/.config/nvim',
    }
    task_link(vimmap, keep)

def init():
    p = Path('~/.config')
    if not p.is_dir():
        if p.exists():
            raise ValueError('~/.config must be a directory!')
        else:
            p.mkdir()
    p = Path('.undodir')
    if not p.is_dir():
        if p.exists():
            print('please remove .undodir in this directory!')
        else:
            p.mkdir()
    p = Path('plugged/pikacode.vim')
    if not p.is_dir():
        if p.exists():
            print('please remove plugged/pikacode.vim')
        else:
            run_cmd('git clone --depth=1'
                    ' https://github.com/leomao/pikacode.vim.git'
                    ' plugged/pikacode.vim')

def update():
    run_cmd('git pull --rebase --depth=1')
    run_cmd('vim +PlugClean +PlugUpdate +qall')

if __name__ == '__main__':
    os.chdir(FILE_PATH)
    args = parser.parse_args()
    if args.command == 'link':
        task_vim(args.keep)
    elif args.command == 'update':
        update()
    else:
        init()
        task_vim(args.keep)
        run_cmd('vim +PlugInstall +qall')

