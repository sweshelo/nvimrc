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
nmap <c-a> 0
nmap <c-e> $
nmap - <c-a>
nmap + <c-x>
nmap <esc><esc> :nohlsearch<cr><cr>

" NERDTree 開く
nmap <Space>ls :NERDTreeToggle<CR>

" 新しいタブ
nmap <Space>t  :tabnew<CR>

" ターミナル
nmap tt :bo term<CR><c-w>w20<c-w>+<c-w>j

" WindowsでBackSpace出来ない
if has('win32') || has('win64')
    imap <Char-0x08> <BS>
endif
