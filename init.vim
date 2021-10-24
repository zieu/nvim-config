source ~/.config/nvim/maps.vim

" Plugins
call plug#begin('~/.vim/plugged')

"Git
Plug 'tpope/vim-fugitive'

" cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" themes
Plug 'projekt0n/github-nvim-theme'
Plug 'liuchengxu/space-vim-dark'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Commentary
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'

" Javascript
Plug 'pangloss/vim-javascript'
"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" enables syntax highlighting
syntax on

" Better colors and theme
set termguicolors
colorscheme github_*

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=2

" adds line numbers
set number

" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 12 lines from top or bottom
" set scrolloff=12

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" use system clipboard
set clipboard=unnamedplus

" list files/git files fzf
command! Ctrlp execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles'
nnoremap <C-p> :Ctrlp<CR>

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" gitgutter config
let g:gitgutter_max_signs = 500
let g:gitgutter_max_signs = -1

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" tab/space config
set smarttab
set cindent
set tabstop=2
set shiftwidth=2

" Emmet config
let g:user_emmet_mode='a'    "enable all function in all mode.
imap <C-E> <C-Y>,
nmap <C-E> <C-Y>,

"highlighted yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

" comment config
imap <C-_> gcc
nmap <C-_> gcc
vmap <C-_> gc

if exists('g:context#commentstring#table')
  let g:context#commentstring#table['javascript.jsx, tsx'] = {
              \ 'jsComment' : '// %s',
              \ 'jsImport' : '// %s',
              \ 'jsxStatment' : '// %s',
              \ 'jsxRegion' : '{/*%s*/}',
              \}
endif

" prevent ctrl+z killing session
nnoremap <C-Z> <nop>
inoremap <C-Z> <nop>

" terminal maps
if has('nvim')
  tnoremap jk <C-\><C-n>
endif

" Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

