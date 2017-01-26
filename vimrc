" +---------------------------------------------------------------------+
" | @AUTHOR: C. Tsanikidis                                              |
" | Last Edit: Mon May 20                                               |
" +---------------------------------------------------------------------+

" Bare Vim {{{
" Essentials
"{{{
set nocompatible "prefers VIM version.
let mapleader=","

filetype on        " file type detection according to $VIMRUNTIME:filetype.vim
filetype indent on " Loads indent.vim in 'runtimepath'
filetype plugin on

syntax enable      " Enabling highlighting

set listchars=tab:·\
set listchars+=precedes:<,extends:>

set ignorecase     " ignore case
set smartcase      " except we have an uppercase
set hlsearch
set autoindent

" Encoding (check iconv() for more conversions)
set fileencoding=utf-8  " This is How the File will be stored"
set encoding=utf-8      " This is Encoding IN VIM

set history=500         " Extend history

set incsearch           " incremental search or LIVE search
set showmatch           " matching parens braces etc etc
set mat=5

set background=dark
set showcmd             " shows the keys pressed
set magic               " for regular expressions

set tabstop=4           " how much characters is a tab
set shiftwidth=4        " indent
set softtabstop=4
set smarttab

set relativenumber
set number

set matchpairs+=<:>,«:» " vs targets.vim, especially if not installed
set hidden              " Make buffers not need being saved

" reminder of 80 columns
set textwidth=80
set colorcolumn=+1

highlight ColorColumn ctermbg=DarkRed guibg=Black

" +----------------------------------------------------------------------+
" | Wrapping                                                             |
" +----------------------------------------------------------------------+

set wrap " This defines whether lines will break if are large enough or not
set sidescroll=5

" +----------------------------------------------------------------------+
" | "Greek support                                                       |
" +----------------------------------------------------------------------+
"
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU
set langmap+=ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp
set langmap+=qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

"remapping creation of windows
set splitbelow
set splitright

"fix problems with backspace (delete)

set backspace=indent,eol,start

"Redraw screen when it is necessery
"set lazyredraw

" +-------------------------------------------------------------------------+
" | Folding Indicators                                                      |
" | Reserve 3 Columns                                                       |
" +-------------------------------------------------------------------------+
set foldcolumn=3

" +-------------------------------------------------------------------------+
" | Persistent Undo                                                         |
" +-------------------------------------------------------------------------+
if has('persistent_undo')
	set undodir=$HOME/.vim/VIM_UNDOFILES
	set undolevels=5000
	set undofile
endif

set virtualedit=block " Edit even if character is not there

set wildmenu "Beautiful Menu
set nomore   "Dont Page Long Listings
set autoread "Always reload buffer when external changes detected

set infercase "Adjust completions to match case
set viminfo=h,'500,<10000,s1000,/1000,:1000

set thesaurus+=~/Documents/thesaurus    "Add thesaurus file for ^X^T
set dictionary+=~/Documents/dictionary  "Add dictionary file for ^X^K

set scrolloff=1 "Scroll When N Lines away from top/bottom

" Custom Status Line - If another line is not available
"set statusline=%f
"set statusline+=%<
"set statusline+=\ %m
"set statusline+=\ -
"set statusline+=\ %Y
"set statusline+=\ -\
"set statusline+=%l
"set statusline+=\ of\
"set statusline+=%L
"set statusline+=%=
"set statusline+=\|\ ascii\ %b\
"set statusline+=\|\ #b\ %o\
"set statusline+=\|\ c:%c\ l:%l\


if has('autocmd')
"	autocmd InsertLeave * :silent execute "!xkbset nullify lock"
"	autocmd InsertEnter * :silent execute "!xkbset nullify -lock"
	autocmd WinLeave    * call SmartRelativeNums(0)
	autocmd WinEnter    * call SmartRelativeNums(1)
	function! SmartRelativeNums(wanted)
		if &number
			let &relativenumber=a:wanted
		endif
	endfunction

	"Restore File Specific Settings / like Folds
	"autocmd BufWinLeave *.* :mkview
	"autocmd BufWinEnter *.* :silent loadview
endif

"vmap     <F1> !boxes -p a1 -d stone -s 80  <CR>gv4jgc
"vmap     <F2> !boxes -d stone -s 80  <CR>gv2jgc
"vmap     <F4> !boxes   <CR>gv2jgc
"vmap     <F3> !boxes -r<CR>



"}}}
"
" Functions
"{{{
"relative numbers toogling
function! NumberToggle()
if(&relativenumber == 1)
	set norelativenumber
else
	set relativenumber
endif
endfunc

function! Trim()
	if search('\s\+$', 'cnw')
		:%s/\s\+$//g
	endif
endfunction

"------[ Magically build interim directories if necessary ]-------------------

function! AskQuit (msg, options, quit_option)
	if confirm(a:msg, a:options) == a:quit_option
		exit
	endif
endfunction

function! EnsureDirExists ()
	let required_dir = expand("%:h")
	if !isdirectory(required_dir)
		call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
            \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

"}}}

" Mappings
"{{{
nnoremap <C-n>            :call NumberToggle()<cr>
nnoremap <C-P>            :FZF<CR>
nnoremap <C-O>            o<esc>



" QuickFix "{{{
nnoremap <Tab>			  :cn<CR>
nnoremap <S-Tab>		  :cN<CR>
nnoremap <F9>			  :cope<CR>
nnoremap <F8>			  :make<CR>
"}}}

" Other {{{
nnoremap <leader>al        :n<CR>
nnoremap <leader>at        :argadd %<CR>
nnoremap <leader>ak        :N<CR>
nnoremap <leader>l        :bnext<CR>
nnoremap <leader>k        :bprev<CR>
nnoremap <Left>           :tabprev<CR>
nnoremap <Right>          :tabnext<CR>
"}}}

" Doubles"{{{
nnoremap <leader>rr       :registers<CR>
nnoremap <leader>aa       :args<CR>
"}}}

" Leader T"{{{
nnoremap <Leader>tt       :tabedit<CR>
nnoremap <Leader>tq       :tabclose<CR>
nnoremap <Leader>to       :tabonly<CR>
"}}}

" Leader B"{{{
nnoremap <Leader>bn       :buffer
nnoremap <Leader>bq       :bd!<CR>
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
nnoremap <Leader>en       :tabnew ~/Dropbox/Magic\ Lists/en.txt<CR>
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
nnoremap <Leader>zfi       :set foldmethod=indent<CR>
nnoremap <Leader>zf{       :set foldmethod=marker<CR>
"}}}

"}}}
"}}}

" Plugins

"{{{
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/loremipsum'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mbbill/undotree'
Plug 'tpope/vim-speeddating'
Plug 'zirrostig/vim-schlepp'
Plug 'dpwright/vim-gf-ext'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'vim-scripts/vim-ocaml-conceal'
Plug 'rgrinberg/vim-ocaml'
Plug 'let-def/ocp-indent-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'

"Plug 'easymotion/vim-easymotion'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'triglav/vim-visual-increment'
"Plug '4Evergreen4/vim-hardy'
call plug#end()
"}}}

" Smart `gf'
"{{{
set suffixesadd+=.js,.ml "For Javascript,Ocaml Types

call gf_ext#add_handler('\.pdf$' , "!o")
call gf_ext#add_handler('\.png$' , "!o")
call gf_ext#add_handler('\.jpg$' , "!o")
call gf_ext#add_handler('\.jpeg$', "!o")
"}}}

" +-----------------------------------------------------------------------+
" |                                                                       |
" | Plugins Configs                                                       |
" |                                                                       |
" +-----------------------------------------------------------------------+

" +-----------------------------------------------------------------------+
" | " Search Tool                                                         |
" +-----------------------------------------------------------------------+

nnoremap <leader>rg :Ack 


" +-----------------------------------------------------------------------+
" | EasyAlign Plugin                                                      |
" +-----------------------------------------------------------------------+

" {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)
" }}}

" +-----------------------------------------------------------------------+
" | Emmet Key                                                             |
" +-----------------------------------------------------------------------+

let g:user_emmet_leader_key = '<C-e>'

" +-----------------------------------------------------------------------+
" | OCaml Opam Config                                                     |
" +-----------------------------------------------------------------------+

" set rtp^="~/.opam/system/share/ocp-indent/vim"
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

" +----------------------------------------------------------------------+
" | Ultisnips                                                            |
" +----------------------------------------------------------------------+

let g:UltiSnipsExpandTrigger="<C-Y>"

" +---------------------------------------------------------------------+
" | FZF                                                                 |
" +---------------------------------------------------------------------+

" {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

let g:livepreview_previewer = 'open'
"}}}

" +----------------------------------------------------------------------+
" | Move Blocks Beautifuly                                               |
" +----------------------------------------------------------------------+

"{{{
try
	vmap <unique> <up>    <Plug>SchleppUp
	vmap <unique> <down>  <Plug>SchleppDown
	vmap <unique> <left>  <Plug>SchleppLeft
	vmap <unique> <right> <Plug>SchleppRight
catch
endtry
"}}}


" +----------------------------------------------------------------------+
" | Utilization of autocmd functionality                                 |
" +----------------------------------------------------------------------+
"
if has('autocmd')
	"------ OCAML ------------------------------------------------------------
	autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)
	autocmd FileType ocaml vnoremap <buffer> <F1> !boxes -i box -d caml<CR>
	"------ VIM --------------------------------------------------------------
	autocmd FileType vim vnoremap <buffer> <F1> !boxes -s 80 -d stone<CR>gv2j!boxes -d vim-cmt<CR>
	autocmd FileType vim setlocal foldmethod=marker
	"------ SASS -------------------------------------------------------------
	autocmd BufWritePost  *.scss :call CompileSass()

	function! CompileSass()
			if executable("sass") && filereadable("Makefile")
					!make
			endif
	endfunc
	"------ END --------------------------------------------------------------
endif

if has('termguicolors')
	set termguicolors
	" colorscheme desert
endif

if has('gui_running')
	try
		colorscheme solarized
	catch  /^Vim\%((\a\+)\)\=:E185/
		" Alternatives?
	endtry
endif

set t_ti= t_te= "Make Vim Not Clear Screen after exit, like Vi
set cpo+=$

" Neovim Specific
if has('nvim')
	set inccommand=split
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#branch#displayed_head_limit = 10
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#enabled = 1

