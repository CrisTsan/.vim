set nocompatible "prefers VIM version.
let mapleader=","

filetype on "file type detection
filetype indent on
filetype plugin on

syntax enable "Enabling highlighting

set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8 "This is How the File will be stored"
set encoding=utf-8 "This is Encoding IN VIM
set number "Line numbers
set history=100 "Extend history
set smartcase "smart search for case
set incsearch "incremental search or LIVE search
set showmatch "matching parens braces etc etc
set mat=5

set background=dark
set showcmd "shows the keys pressed
set ruler "activate all the time the ruler
set magic "for regular expressions

set tabstop=4
set shiftwidth=4 "indent
set softtabstop=4
set smarttab

set relativenumber
set number

set matchpairs+=<:>,«:»


set hidden "Make buffers not need being saved

" reminder of 80 columns
set textwidth=79
set colorcolumn=+1
set wrap
highlight ColorColumn ctermbg=black guibg=darkblue
" Custom Highlight of 80th Character

"highlight Bang ctermbg=darkblue guibg=red
"match Bang /\%>79v.*\%<81v/


"highlight NonText ctermbg=darkblue guibg=darkblue

"Greek support
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

"remapping creation of windows

set splitbelow
set splitright

"fix problems with backspace (delete)

set backspace=indent,eol,start

"Redraw screen when it is necessery
set lazyredraw

" Folding Indicators
" Reserve 3 Columns

set foldcolumn=1
set fdc=3

"--[ Persistent Undo ]---------------------------
if has('persistent_undo')
	set undodir=$HOME/.vim/VIM_UNDOFILES
	set undolevels=5000
	set undofile
endif
"--[ Edit even if Character is not there ]------
set virtualedit=block

set wildmenu "Beautiful Menu
set nomore "Dont Page Long Listings
"set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected

set infercase                       "Adjust completions to match case

set viminfo=h,'500,<10000,s1000,/1000,:1000


set thesaurus+=~/Documents/thesaurus    "Add thesaurus file for ^X^T
set dictionary+=~/Documents/dictionary  "Add dictionary file for ^X^K



set scrolloff=3 "Scroll When 3 Lines away from top/bottom

set statusline=%f
set statusline+=%<
set statusline+=\ %m
set statusline+=\ -\ 
set statusline+=file
set statusline+=\ %Y
set statusline+=\ -\ 
set statusline+=%l
set statusline+=\ of\ 
set statusline+=%L
set statusline+=%=
set statusline+=\|\ ascii\ %b\ 
set statusline+=\|\ #byte\ %o\ 


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

	"autocmd InsertEnter * :silent setlocal nohlsearch
	"autocmd InsertLeave * :silent setlocal hlsearch

	"  autocmd FocusLost   * :set norelativenumber
	"  autocmd FocusGained * :set relativenumber
	"  autocmd InsertEnter * :set norelativenumber
	"  autocmd InsertLeave * :set relativenumber

	"Restore File Specific Things
	autocmd BufWinLeave *.* :mkview
	autocmd BufWinEnter *.* :silent loadview
	"Auto Indent HTML File before saving. Go back to cursor
	"  autocmd BufWritePre,BufRead *.html :normal gg=G''
	"  autocmd BufNewFile,BufRead *.html setlocal nowrap
	"
	"  augroup filetype_html
	"	  autocmd!
	"	  autocmd Filetype *.html :set tabstop=3
	"  augroup END
endif

vmap <F1> !boxes -p a1 -d stone <CR>gv4jgc
vnoremap <F2> !boxes -p a1 -d stone -s 80<CR>
vnoremap <F3> !boxes -r <CR>gv!boxes -r<CR>

