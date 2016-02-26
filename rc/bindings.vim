" CTRL - Smth "{{{
nnoremap <C-n>            :call NumberToggle()<cr>
nnoremap <C-P>            :FZF<CR>
nnoremap <C-O>            o<esc>
"}}}

nnoremap <Left>           :tabprev<CR>
nnoremap <Right>          :tabnext<CR>

nnoremap <leader>al        :n<CR>
nnoremap <leader>at        :argadd %<CR>
nnoremap <leader>ak        :N<CR>
nnoremap <leader>l        :bnext<CR>
nnoremap <leader>k        :bprev<CR>

" Doubles"{{{
nnoremap <leader>rr       :registers<CR>
nnoremap <leader>aa       :args<CR>
nnoremap <Leader>tt       :tabedit<CR>
"}}}

" Leader T"{{{
nnoremap <Leader>tt       :tabedit<CR>
nnoremap <Leader>tq       :tabclose<CR>
nnoremap <Leader>to       :tabonly<CR>
"}}}

" Leader B"{{{
nnoremap <Leader>bn       :buffer
nnoremap <Leader>bq       :bd!<CR>
nnoremap <Leader>b<Left>  :bprev<CR>
nnoremap <Leader>b<Right> :bnext<CR>
nnoremap <Leader>b<Down>  :new<CR>
nnoremap <Leader>b<Up>    :below new<CR>
"}}}

" Special"{{{
nnoremap <Leader>ev       :tabnew $MYVIMRC<cr>
nnoremap <Leader>sv       :source $MYVIMRC<cr>
noremap  <Leader>su       :w !sudo tee % > /dev/null
nnoremap <Leader>p        :setlocal paste!<CR>
nnoremap <Leader>cdc      :cd %:p:h<CR>
nnoremap <Leader>sgr      :setlocal spell spelllang=el_GR<CR>
nnoremap <Leader>sen      :setlocal spell spelllang=en<CR>
nnoremap <Leader>ml       :tabnew ~/Dropbox/Magic\ Lists/buffer.txt<CR>
"}}}

" . Filetype"{{{
nnoremap <Leader>.p       :set filetype=php<CR>
nnoremap <Leader>.h       :set filetype=html<CR>
nnoremap <Leader>.j       :set filetype=javascript<CR>
nnoremap <Leader>.c       :set filetype=c<CR>
nnoremap <Leader>.a       :filetype detect<CR>
"}}}

" zf Folding Bindings {{{
nnoremap <Leader>zfs       :set foldmethod=syntax<CR>
nnoremap <Leader>zfm       :set foldmethod=manual<CR>
nnoremap <Leader>zfi       :set foldmethod=syntax<CR> 
nnoremap <Leader>zfi       :set foldmethod=indent<CR>
nnoremap <Leader>zf{       :set foldmethod=marker<CR>
nnoremap <Space>           za
vnoremap <Space>           zf
"}}}

" Tabularize"{{{
vnoremap <leader>=        :Tab /=<CR>
vnoremap <leader><space>  :Tab / /<CR>
vnoremap <leader>:        :Tab /:/ <CR>
vnoremap <leader>;        :Tab /;/<CR>
"}}}

" BIG DEAL"{{{
noremap : ;
noremap ; :
"}}}

"onoremap b /return<CR>

"nnoremap ci<       :call search("<",'c')<CR>ci<
"nnoremap ci{       :call search("{",'c')<CR>ci{
"nnoremap ci[       :call search("[",'c')<CR>ci[
"nnoremap ci>       :call search(">",'c')<CR>ci>
"nnoremap ci}       :call search("}",'c')<CR>ci}
"nnoremap ci]       :call search("]",'c')<CR>ci]
"nnoremap ci)       :call search(")",'c')<CR>ci)
"nnoremap ci(       :call search("(",'c')<CR>ci(
"
"nnoremap di<       %di<
"nnoremap di{       %di{
"nnoremap di[       %di[
"nnoremap di>       %di>
"nnoremap di}       %di}
"nnoremap di]       %di]
"
"nnoremap yi<       %yi<
"nnoremap yi{       %yi{
"nnoremap yi[       %yi[
"nnoremap yi>       %yi>
"nnoremap yi}       %yi}
"nnoremap yi]       %yi]
