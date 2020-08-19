" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

" Bootstrap {
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" }
" Plugins {
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

" wiki
Plug 'vimwiki/vimwiki'

" easymotion
Plug 'easymotion/vim-easymotion'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" tests
Plug 'junegunn/vader.vim'

" deoplete plugins
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'fszymanski/deoplete-emoji'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Limelight; Focus on stuff
Plug 'junegunn/limelight.vim'

" Scalpel: better word replacer within a file
" invoked with <Leader>e by default
Plug 'wincent/scalpel'

" Briefly highlight the yanked region
Plug 'machakann/vim-highlightedyank'

" Macro helper
" <CR> will replay last recorded macro
Plug 'wincent/replay'

" multi-cursor FTW
Plug 'terryma/vim-multiple-cursors'

" Better mark management
Plug 'kshenoy/vim-signature'

" fuzzy file completion, me gusta!
Plug 'ctrlpvim/ctrlp.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Async File Linter, whoohoo
Plug 'w0rp/ale'

" jsonnet
Plug 'google/vim-jsonnet'
" Easily align text
" used by puppet-vim
Plug 'godlygeek/tabular'

" ctags support/puppet-vim
Plug 'majutsushi/tagbar'

" reqs for snipmate (utility plugins)
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'garbas/vim-snipmate'

Plug 'rodjek/vim-puppet'

" Highlight ugly extra whitespace
Plug 'ntpeters/vim-better-whitespace'

" fuzz all the things
Plug 'junegunn/fzf.vim'

"Open file under cursor with 'gf'
Plug 'amix/open_file_under_cursor.vim'

" tpope FTW
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'

" Languages
Plug 'saltstack/salt-vim'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.py' }
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'hynek/vim-python-pep8-indent'
Plug 'fatih/vim-go'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'vim-ruby/vim-ruby' " solargraph
Plug 'mrk21/yaml-vim' " For hieradata
Plug 'elzr/vim-json' " For metadata.json
Plug 'cespare/vim-toml' " TOML

" PyDoc to quickly access documentation
Plug 'fs111/pydoc.vim'

" Tabmanager - visualizing tabs in vim
Plug 'kien/tabman.vim'

" themes
Plug 'josuegaleas/jay'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" search files with ack/ag
Plug 'mileszs/ack.vim'


Plug 'vim-airline/vim-airline'

" syntax/indent/ftplugins for a many languages/tools (fucks up MD)
"Plug 'sheerun/vim-polyglot'

" Visual helper
Plug 'Yggdroot/indentLine'
" Autoscroll
Plug 'yuttie/comfortable-motion.vim'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Initialize plugin system
call plug#end()

" }
"  Looks {
set number
syntax enable
set background=dark
colorscheme jay
set t_Co=256

" Live preview of substitutions
if has('nvim')
  set inccommand=split
endif

" Show matching brackets when text indicator is over them
set showmatch

" }
" Auto Commands {
" Asciidoc
au BufWritePost *.adoc silent! !head -1 % | grep autocompile && asciidoctor-pdf % || true

" #### Fixes code-completion bug
" autocmd BufRead,BufNewFile *.py :set omnifunc=python3complete#Complete
au BufRead,BufNewFile *.yml setf ansible

" Remove trailing spaces on write
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
au BufWritePre * %s/\s\+$//e

" Filetypes
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead Jenkinsfile  setf groovy

" Markdown
au FileType markdown setlocal cole=1

" python
" au VimEnter *.py NERDTree
" au VimEnter *.py Tagbar
au VimEnter * wincmd p

" Vim-Go
au FileType go nmap <Leader>d :GoDoc<CR>
au FileType go nmap <Leader>D :GoDocBrowser<CR>
au FileType go nmap <Leader>g :GoDef<CR>
au FileType go nmap <Leader>i :GoImports<CR>
au FileType go nmap <leader>b :GoBuild<CR>
au FileType go nmap <leader>r :GoRun<CR>
au FileType go nmap <leader>f :GoErrCheck<CR>
au FileType go inoremap <buffer> . .<C-x><C-o>

" python-mode
au FileType py nmap <leader>g  :RopeGotoDefinition<CR>
au FileType py nmap <leader>r  :PymodeRun<CR>
au FileType py nmap <leader>d  :PymodeDoc<CR>
au FileType py nmap <leader>f  :PymodeLint<CR>

" Terminal
" Enter insert mode when we switch to a terminal
" Super useful 😻
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" }
" Mouse {
set mouse=
set clipboard^=unnamed,unnamedplus
" }
" Cursor {
set cursorline
" }
" History {
set history=700
" set backup
if has("persistent_undo")
    set undofile
    set undolevels=1000
    set undodir=$HOME/.VIM_UNDO_FILES
endif
" }
" Behaviour {
set expandtab           " enter spaces when tab is pressed
set textwidth=100       " break lines when line length increases
set formatoptions-=t    " No autolinebreak
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set softtabstop=2
set iskeyword+=_,$,@,%,#    " none of these are word dividers
" }
" Folding {
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" }
" Completion {
set wildmenu
set wildmode=longest:full,full

" With ack-vim: Use the_silver_searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" ignore unneccessary file types in autocomplete mode
set wildignore+=*.dict,*.aux,*.nav,*.out,*.toc,*.vrb,*.snm
" }
" Sound {
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }
" Encoding {
" Make sure utf-8 is used
" Not really needed for neovim but vim
set encoding=utf-8
set termencoding=utf-8
" }
" Search {
set incsearch
set ignorecase
" Cancel selection on backspace
nmap <silent> <BS> :nohlsearch<CR>
" Set the search scan to wrap around the file
set wrapscan
" Turn on Highlighting of search results
set hlsearch
" }
" General {
" Auomatically set the terminal title
set title

" No redraw durring macros
set lazyredraw

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Filetypes
filetype plugin on
filetype indent on
" }
" Mappings {
let mapleader = ","
let g:mapleader = ","

" Selection {
vnoremap > >gv
vnoremap < <gv

" Move selected lines vertically
xnoremap K :m '<-2<CR>gv=gv
xnoremap J :m '>+1<CR>gv=gv

 " allow cursor to move where there is no text in visual block mode
if has('virtualedit')
  set virtualedit=block
endif
" }

" Buffers {
" ALT-n next buffer and list, ALT-p previous buffer
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
"nnoremap <C-n> :bnext<CR>:redraw<CR>
"nnoremap <C-p> :bprevious<CR>:redraw<CR>

" Split Screen
nnoremap <Leader>s- :split<CR>
nnoremap <Leader>s\| :vsplit<CR>

" Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }

" Nifty tricks {
" Write files as root
cmap w!! w !sudo tee > /dev/null %

" #### Clean trailing whitespaces
nnoremap <silent> <Leader>cw :call Preserve("%s/\\s\\+$//e")<CR>
xnoremap <silent> <Leader>cw :call Preserve("'<,'>s/\\s\\+$//e")<CR>
function! Preserve(command)
  " Preparation: save window state
  let l:saved_winview = winsaveview()
  " Run the command:
  execute a:command
  " Clean up: restore previous window position
  call winrestview(l:saved_winview)
endfunction
" }
" }
" Motion {
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Movement {
" https://neovim.io/doc/user/nvim_terminal_emulator.html
" Use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" }

" Disable arrow keys {
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
" }

" Plugin Mappings {
" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" #### Limelight
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>

" #### EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" #### Tabularize
nmap <Leader>t  :Tabularize / <CR>
vmap <Leader>t  :Tabularize / <CR>
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" #### Asciidoctor-pdf
nmap <Leader>adc :!asciidoctor-pdf %<CR>

" #### NERDTree
nmap <Leader>nt :NERDTreeToggle<CR>

" fast access to fzf
map <leader>fl :BLines<CR>
map <leader>ff :FZF<CR>
map <leader>fgf :GFiles<CR>
map <leader>fh :History<CR>
map <C-P> :FZF .<CR>

" #### Tagbar
nmap <Leader>tt :TagbarToggle<CR>
" }
" }
" Autocmds {
" }
" Plugin Options {
" Airline {
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists   = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" }

" CtrlP.vim {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Working Path Mode:
" 'c' - the directory of the current file.
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to "r": start search from the cwd instead of the current file's directory
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" }

" Tabman {
let g:tabman_toggle = '<leader>mt'
let g:tabman_focus  = '<leader>mf'
let g:tabman_side = 'left'
let g:tabman_width = 25
" Set this to 1 to show windows created by plugins, help and quickfix:
let g:tabman_specials = 0
" Set this to 0 to disable line numbering in the TabMan window:
let g:tabman_number = 1
" }
" ansible-vim {
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_syntaxes = "sh.vim python.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_extra_keywords_highlight = 1
" }

" Golang {
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
" }
" pymode {
let g:pymode_python = 'python3'
" }

" json {
let g:vim_json_syntax_conceal = 0
" }

" dont make ** to fat
let g:indentLine_setConceal = 0

" nerdtree {
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.mypy_cache']
" }
" tagbar
let g:tagbar_position = 'right'
" vim-wiki {
let g:vimwiki_list = [{'path': '~/.vimwiki/code', 'path_html': '~/.vimwiki/html'}]
" }
" }
"
