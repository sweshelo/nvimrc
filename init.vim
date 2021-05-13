" 基本設定
source ~/.config/nvim/normal.vim

" キーマップ設定
source ~/.config/nvim/keymap.vim

" dein.vim 設定 {{{
if &compatible
    set nocompatible
endif

" OS毎に設定を変える
if has('win32') || has('win64')
    let s:dein_dir  = expand('~/AppData/Local/nvim')
    let s:dein_toml = expand('~/AppData/Local/nvim/plug/normal.toml')
else
    let s:dein_dir  = expand('~/.config/nvim')
    let s:dein_toml = expand('~/.config/nvim/plug/normal.toml')
endif

set runtimepath+=~/.cache\dein\repos\github.com\Shougo\dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
"}}}

" プラグイン 設定
source ~/.config/nvim/plugin.vim

if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[6 q"
    let &t_SR .= "\e[6 q"
endif

filetype plugin indent on
syntax enable

colorscheme molokai 
