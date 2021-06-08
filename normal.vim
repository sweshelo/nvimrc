set nowritebackup
set nobackup
set noswapfile
set noerrorbells

set backspace=indent,eol,start
set ambiwidth=double
set wildmenu
set encoding=utf-8

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set showmatch matchtime=1
set laststatus=2
set showcmd
set list
set listchars=tab:^\ ,trail:~,extends:›
set history=10000
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showmatch
set smartindent

set title
set number
set virtualedit=onemore

set clipboard=unnamed
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~

set cursorline
set foldmethod=marker

" scss保存時にコンパイル
function! SassCompile()
    if expand("%:r")[0] != '_'
        :!sass %:`echo %|sed 's/scss/css/g'`
    endif
endfunction
autocmd! BufWritePost *.scss :call SassCompile()

" ss保存時にコンパイル
function! TsCompile()
    if expand("%:r")[0] != '_'
        :!tsc %:
    endif
endfunction
autocmd! BufWritePost *.ts :call TsCompile()

"補完 有効化
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=xmlcomplete#CompleteTags, dictionary=~/.config/nvim/plug/dict/php.dict

" HTML/XML閉じタグ自動補完
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
augroup END

filetype indent on
