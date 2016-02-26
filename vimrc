"{{{
so ~/.vim/rc/essentials.vim " The absolute package
so ~/.vim/rc/functions.vim  " defined functions
so ~/.vim/rc/bindings.vim   " my own bindings
so ~/.vim/rc/plugins.vim    " for plugin installations
so ~/.vim/rc/ftspecific.vim    " for plugin installations
"}}}

" Plug {{{
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'enomsg/vim-haskellConcealPlus'

"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'triglav/vim-visual-increment'
"Plug '4Evergreen4/vim-hardy'
call plug#end()
" }}}

" set suffixesadd+=.js
call gf_ext#add_handler('\.png$', "!feh")
call gf_ext#add_handler('\.jpg$', "!feh")

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

let g:user_emmet_leader_key = '<C-e>'
set listchars=tab:·\ 
