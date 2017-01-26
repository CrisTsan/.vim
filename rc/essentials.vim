set nocompatible "prefers VIM version.
let mapleader=","

filetype on        " file type detection according to $VIMRUNTIME:filetype.vim
filetype indent on " Loads indent.vim in 'runtimepath'
filetype plugin on

syntax enable "Enabling highlighting

set listchars=tab:·\ 
set ignorecase "ignore case
set smartcase  "except we have an uppercase

set hlsearch
set autoindent

" +------------------------------------------------------------------------------+
" | Encoding (check iconv() for more conversions)                                |
" +------------------------------------------------------------------------------+

set fileencoding=utf-8 " This is How the File will be stored"
set encoding=utf-8     " This is Encoding IN VIM

set history=500 "Extend history

set incsearch "incremental search or LIVE search
set showmatch "matching parens braces etc etc
set mat=5

set background=dark
set showcmd "shows the keys pressed
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
" set textwidth=80
set colorcolumn=+1

highlight ColorColumn ctermbg=black guibg=darkblue

" +------------------------------------------------------------------------------+
" | Wrapping                                                                     |
" +------------------------------------------------------------------------------+

set nowrap " This defines whether lines will break if are large enough or not dakosdko askod askod oasd as dasdasdasdas das das ddsakdasdkas ka s
set sidescroll=5
set listchars+=precedes:<,extends:>

"Greek support
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

"remapping creation of windows
set splitbelow
set splitright

"fix problems with backspace (delete)

set backspace=indent,eol,start

"Redraw screen when it is necessery
set lazyredraw

" +------------------------------------------------------------------------------+
" | Folding Indicators                                                           |
" | Reserve 3 Columns                                                            |
" +------------------------------------------------------------------------------+

set foldcolumn=1
set fdc=3

" +------------------------------------------------------------------------------+
" | Persistent Undo                                                              |
" +------------------------------------------------------------------------------+
if has('persistent_undo')
	"set undodir=$HOME/.vim/VIM_UNDOFILES
	set undolevels=5000
	set undofile
endif
" +------------------------------------------------------------------------------+
" | Edit even if Character is not there                                          |
" +------------------------------------------------------------------------------+
set virtualedit=block

set wildmenu "Beautiful Menu
set nomore   "Dont Page Long Listings
set autoread "Always reload buffer when external changes detected

set infercase "Adjust completions to match case
set viminfo=h,'500,<10000,s1000,/1000,:1000

set thesaurus+=~/Documents/thesaurus    "Add thesaurus file for ^X^T
set dictionary+=~/Documents/dictionary  "Add dictionary file for ^X^K

set scrolloff=2 "Scroll When N Lines away from top/bottom

" +------------------------------------------------------------------------------+
" | Custom Status Line                                                           |
" +------------------------------------------------------------------------------+
set statusline=%f
set statusline+=%<
set statusline+=\ %m
set statusline+=\ -
set statusline+=\ %Y
set statusline+=\ -\ 
set statusline+=%l
set statusline+=\ of\ 
set statusline+=%L
set statusline+=%=
set statusline+=\|\ ascii\ %b\ 
set statusline+=\|\ #b\ %o\ 
set statusline+=\|\ c:%c\ l:%l\ 


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

	"Restore File Specific Things
	autocmd BufWinLeave *.* :mkview
	autocmd BufWinEnter *.* :silent loadview
endif

"vmap     <F1> !boxes -p a1 -d stone -s 80  <CR>gv4jgc
"vmap     <F2> !boxes -d stone -s 80  <CR>gv2jgc
"vmap     <F4> !boxes   <CR>gv2jgc
"vmap     <F3> !boxes -r<CR>


