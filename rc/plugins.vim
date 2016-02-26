"------[ Ulti Snips ]---------------------

let g:UltiSnipsExpandTrigger="<C-Y>"
"let g:UltiSnipsJumpForwardTrigger="<C-Y>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Z>"

"-----[ FZF ]-----------------------------

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

let g:livepreview_previewer = 'mupdf'

"---[ Amazing Movement ]------
try
	vmap <unique> <up>    <Plug>SchleppUp 
	vmap <unique> <down>  <Plug>SchleppDown
	vmap <unique> <left>  <Plug>SchleppLeft
	vmap <unique> <right> <Plug>SchleppRight
catch
endtry

"---[ Personal ]------------

"autocmd CursorMoved * call MyFun()

let g:myvar=0
function! MyFun ()
	let g:myvar+=1
	echo g:myvar
endfunction

