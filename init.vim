set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jpalardy/vim-slime'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vimperator/vimperator.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-latex/vim-latex'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-scripts/Tabmerge'
Plugin 'stephpy/vim-yaml'
Plugin 'JulioJu/neovim-qt-colors-solarized-truecolor-only'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Search options
set incsearch 
set ignorecase
set nohlsearch

" Key mappings

" Open NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Automatic split location
set splitbelow
set splitright

" Key binding for executing current line in shell:
nnoremap <C-M> :exec '!' .getline('.')<CR>

" Line numbers
set number

" Visual autocomplete menu
set wildmenu

" Show matching parentheses
set showmatch

" load filetype-specific indent files
filetype indent on

" syntax highlighting
syntax enable
set background=dark
colo solarized 

" R tmux pane options
" let R_in_buffer = 0
" let R_applescript = 0
" let R_tmux_split = 1
" let R_term="screen-256color"
" let R_notmuxconf=1

" R indentation rules
let r_indent_op_pattern = '%[^%]*%$'

let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" Disable Nvim-R's autocompletion of "_" to "<-"
let R_assign = 2

" Show Nvim-R's omni completion as you type
let R_show_args = 0
" Change Nvim-R sourcing behavior
let R_source_args = "print.eval = TRUE, echo = TRUE"

" Use syntax highlighting in Nvim-R terminal
let R_hl_term = 1

" Setup vim-slime to work with tmux
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" Split Navigations 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" TMUX window move stuff
" let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\\> :TmuxNavigatePrevious<cr>

" Set python3 executable
let g:python3_host_prog = '/home/john/miniconda3/bin/python3'

" YouCompleteMe python binary path
let g:ycm_python_binary_path = 'python'

" Vim-Latex Stuff
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Syntastic recommended beginner settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_r_lintr_linters = "with_defaults(camel_case_linter = NULL, object_length_linter = NULL)"

let g:syntastic_python_checkers = ['flake8']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Switch cursor depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ctrlp needs to find dotfiles
let g:ctrlp_show_hidden = 1

" Sudo write trick
command W w !sudo tee % > /dev/null
