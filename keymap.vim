" insert
imap jj <Esc>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-k> <Up>
imap <c-l> <Right>
imap <c-a> <Esc>0a
imap <c-e> <Esc>$a

" normal
nmap ; :
nmap j gj
nmap k gk
nmap <esc><esc> :nohlsearch<cr><cr>

" 新しいタブ
nmap <Space>t  :tabnew<CR>

" ターミナル
nmap tt :split<CR><c-w>j<c-w>J<c-w>w10<c-w>+<c-w>j:term<CR>

" typescriptのシンタックスハイライトがされない問題に暫定対処
nmap <c-H> :set filetype=typescript<CR>

" WindowsでBackSpace出来ない
if has('win32') || has('win64')
    imap <Char-0x08> <BS>
endif

" ジャンプ 別タブで
nmap gf <c-w>gf
