"""""""""""""""""""""""
"     Configs         "
"""""""""""""""""""""""

syntax on
filetype plugin on
filetype plugin indent on

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show matching brackets
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized
set nospell                 " nospell by default
set noshowmode              " not needed because of lightline

" reload file from disk
set autoread
au CursorHold * checktime

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Indentation
set autoindent
set smartindent

" Whitespace handling
set tabstop=4
set shiftwidth=4
set expandtab                  " Use spaces, not tabs
set backspace=indent,eol,start " Backspace through everything

set nocp
set number                  " Line numbering
set relativenumber          " relative lines

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

" Highlight current line
set cursorline
:hi CursorLine   cterm=NONE ctermbg=235 guibg=grey

" Deactivate swap file creation
set noswapfile

set scrolloff=15

if exists('&inccommand')
  set inccommand=split
endif

""""""""""""""""""""""
"     Mappings       "
""""""""""""""""""""""

" Switch leader key to `<Space>`
let mapleader = "\<Space>"

"""""""""""
" Toggles "
"""""""""""
" toggle highlights
nnoremap <Leader>th :noh<CR>
" toggle relative numbers
nnoremap <silent> <Leader>tn :set relativenumber!<CR>
" toggle nerdtree
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tf :NERDTreeFind<CR>

" quick save
nnoremap S :w<CR>

" cool resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" vimux \o/
nnoremap <F11> :w<CR>:VimuxPromptCommand<CR>
nnoremap <F12> :w<CR>:VimuxRunLastCommand<CR>
noremap <Leader>- :w<CR>:VimuxPromptCommand<CR>
noremap <Leader>= :w<CR>:VimuxRunLastCommand<CR>

" j/k for multilines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Split (unjoin) lines
nnoremap K i<CR><ESC>

" remove highlights
map <C-c> :noh<CR>

" some git maps
map <Leader>gb :Gblame<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gee :Gedit<CR>
map <Leader>ges :Gsplit<CR>
map <Leader>get :Gtabedit<CR>
map <Leader>gev :Gvsplit<CR>
map <Leader>gl :Glog<CR>
map <Leader>gr :Gread<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>

" Git checked in files
map <Leader>F :Files<CR>
map <Leader>f :GFiles<CR>
map <Leader>s :Ag 
map <Leader>w :Windows<CR> 
map <Leader>b :Buffers<CR> 
map <Leader>h :History<CR> 

" Marks
nmap <Leader>' :Marks<CR>

" Tags
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

imap <c-x><c-l> <plug>(fzf-complete-line)

" ale map 
map <Leader>n :ALENext<CR>
map <Leader>N :ALEPrevious<CR>

" instant emmet
map <c-e> <c-y>,

" edit files
map <Leader>ev :e ~/.vimrc<CR>
map <Leader>et :e ~/.tmux.conf<CR>
map <Leader>ez :e ~/.zshrc<CR>
map <Leader>es :source $MYVIMRC<CR>

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" window management
nnoremap <Leader>wm :only<CR>
nnoremap <Leader>wh :vsplit<CR>
nnoremap <Leader>wv :split<CR>

"""""""""""""
" AUTOCMD's "
"""""""""""""

autocmd Filetype javascript iabbrev log console.log(<Right>;<Left><Left>
autocmd Filetype php iabbrev log var_dump(<Right>;<Left><Left>
autocmd Filetype php iabbrev flog \Neos\Flow\var_dump(<Right>;<Left><Left>
autocmd Filetype tpl iabbrev log {|var_dump}<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" nerdtree
autocmd StdinReadPre * let s:std_in=1

" makefile needs tabs
autocmd FileType make set noexpandtab

" spell for md
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" Highlight 80 char
autocmd Filetype markdown let &colorcolumn=join(range(81,81),",")



"""""""""""""""""""""""
"   Plugin Settings   "
"""""""""""""""""""""""

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" use ag
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" show hidden files by default
let NERDTreeShowHidden=1

" disable ctrl-t mapping
let g:go_def_mapping_enabled = 0

" Enable elm highlight to use the one from 
" the elm plugin
let g:polyglot_disabled = ['elm']

let g:ale_sign_error = '••'
let g:ale_sign_warning = '--'

" airline
"
" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#docs = 1

inoremap <silent><expr><TAB> deoplete#mappings#manual_complete()
" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:sneak#label = 1

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"""""""""""""""""""""""
"     Sessions        "
"""""""""""""""""""""""

" http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:sessionfile
endfunction

" Loads a session if it exists
function! LoadSession()
    let b:sessiondir = $HOME . '/.vim/sessions' . getcwd()
    let b:sessionfile = b:sessiondir . '/session.vim'
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo 'No session loaded.'
    endif
endfunction

augroup sessions
  autocmd!
  if argc() == 0
    au VimEnter * nested :call LoadSession()
    au VimLeave * :call MakeSession()
  endif
augroup END

call plug#begin('~/.vim/vim-plug-plugins')

    """""""""""""""""""""""""""""""
    "     Language Plugins        "
    """""""""""""""""""""""""""""""

    " elm plugin
    Plug 'elmcast/elm-vim'

    " javascript code completion
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

    " php code completion
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

    " html plugin 
    Plug 'mattn/emmet-vim'

    " vuejs plugin
    Plug 'posva/vim-vue'

    """""""""""""""""""""""""""""""
    "     Editor Plugins          "
    """""""""""""""""""""""""""""""

    Plug 'ternjs/tern_for_vim'

    " use editorconfig
    Plug 'editorconfig/editorconfig-vim'

    " git plugin
    Plug 'tpope/vim-fugitive'

    " filebrowser
    Plug 'scrooloose/nerdtree'

    " fuzzy finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " completion framework
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " colorscheme
    Plug 'morhetz/gruvbox'

    " syntax checking
    Plug 'w0rp/ale'

    " snippets
    Plug 'SirVer/ultisnips'
    
    " run commands from vim inside a tmux pane
    Plug 'benmills/vimux'

    " easily navigate between vim and tmux panes
    Plug 'christoomey/vim-tmux-navigator'
    
    " statusline
    Plug 'vim-airline/vim-airline'

    " show changed lines in file
    Plug 'airblade/vim-gitgutter'

    " Highlight search cursor
    Plug 'inside/vim-search-pulse'

    " missing motion
    Plug 'justinmk/vim-sneak'

    ":BufOnly closes all buffers
    Plug 'vim-scripts/BufOnly.vim'    
call plug#end()

colorscheme gruvbox
set bg=dark

" autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
