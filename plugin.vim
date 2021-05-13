" lightline 設定
let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

" deoplete
let g:deoplete#enable_at_startup = 1

" tsuquyomi
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['php', 'javascript', 'python', 'sh']
    \}


" nerdtree 設定
" 引数なしでvimを開いたらNERDTreeを起動
autocmd vimenter * if !argc() | NERDTree | endif

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
