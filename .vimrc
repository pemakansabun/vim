filetype indent on
syntax on
set colorcolumn=80
set mouse=a
set number
set autochdir
set relativenumber
set ruler
set termguicolors
set ttyfast
set clipboard=unnamedplus
set laststatus=2
set wildmenu
set wildmode=full
set showmatch
set ruler
set ignorecase
set smartcase
set tabstop=2       
set shiftwidth=2    
set softtabstop=2   
set expandtab       
" highlight search
" only highlight while typing
set incsearch
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
let g:netrw_browse_split = 0

autocmd FileType typescript,lua let b:lsp_server = 'tsserver'

call plug#begin()
Plug 'jiangmiao/auto-pairs'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'


Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-l> lsp#scroll(-4)
endfunction
augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Set leader key to space
let g:mapleader = "\<Space>"

" Key mappings
nnoremap <leader>ko :Ex<CR>
nnoremap <leader>t :terminal<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z nnoremap K 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Yank and paste to/from system clipboard
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap <leader>p <Nop>
vnoremap <leader>p <Nop>
nnoremap q <Nop>
vnoremap q <Nop>

" Escape in insert mode with <C-c>
inoremap <C-c> <Esc>

" Quickfix and location list navigation
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" Search and replace with confirmation
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Make the current file executable
nnoremap <leader>x :!chmod +x %<CR>

"window
nnoremap <C-w>o :only<CR>

" Movement shortcuts
nnoremap <C-e> $
nnoremap <C-a> ^
inoremap <C-e> <End>
inoremap <C-a> <Home>

" Source vimrc
nnoremap <leader><leader> :so $MYVIMRC<CR>

colorscheme industry

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
