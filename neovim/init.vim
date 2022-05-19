" NeoVim settings
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8
:set cmdheight=2			" Give more space for displaying messages
:set signcolumn=yes			" Always show the sign column
:set expandtab

" Plugin Definitions
call plug#begin()

Plug 'https://github.com/tpope/vim-surround'				" Surround ysw)
Plug 'https://github.com/vim-airline/vim-airline'			" Status Bar for nvim
Plug 'https://github.com/preservim/nerdtree'				" Nerdtree
Plug 'https://github.com/tpope/vim-commentary'				" For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color'					" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'		" Retro Scheme
Plug 'https://github.com/preservim/tagbar'					" Tagbar for code navigation
Plug 'https://github.com/mg979/vim-visual-multi'			" Visual Block editor; Select Words Ctrl-N 
Plug 'https://github.com/mileszs/ack.vim'					" Run seach tool in nvim
Plug 'https://github.com/ctrlpvim/ctrlp.vim'                " CtrlP fuzzy search

" COC - Conquerer of Completiion - Auto Completion
" Pulls the master branch and builds it with yarn install.  This keeps things up to date
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}	

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'airblade/vim-gitgutter'

call plug#end()

" Nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" TabBar
nmap <F8> :TagbarToggle<CR>

" CtrlP
set wildignore+=*.a,*.o
set wildignore+=node_modules
set wildignore+=.git,.hg,.svn
let g:ctrlp_match_window = "bottom,btt,min:1,max:10,results:25"
" let g:ctrlp_by_filename = 1                                   " Default search is by filename, not regex
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
"
" CoC
inoremap <silent><expr> <c-space> coc#refresh();

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

:colorscheme jellybeans

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

