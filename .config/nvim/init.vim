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

" Powerful multi file search
Plug 'wincent/ferret'

" show all the filePlug 'scrooloose/nerdtree's
" (currently replaced with coc-explorer)
" Plug 'scrooloose/nerdtree'

" Session management
Plug 'thaerkh/vim-workspace'

" show hex colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" LSP code completion/diagnostics
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" better syntax
Plug 'Shougo/neco-syntax'

" Fancy start screen
Plug 'mhinz/vim-startify'

" wiki
Plug 'vimwiki/vimwiki'

" easymotion
Plug 'easymotion/vim-easymotion'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'

" Preview markdown
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

" Async syntax linters/fixers
Plug 'dense-analysis/ale'

" Easily align text
" used by puppet-vim
Plug 'godlygeek/tabular'

" Highlight ugly extra whitespace
Plug 'ntpeters/vim-better-whitespace'

" fuzz all the things
Plug 'junegunn/fzf.vim'

"Open file under cursor with 'gf'
Plug 'amix/open_file_under_cursor.vim'

" tpope FTW
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

" Languages
Plug 'google/vim-jsonnet'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.py' }
Plug 'hashivim/vim-terraform'
Plug 'cespare/vim-toml' " TOML
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tmux-plugins/vim-tmux'

" themes
Plug 'atelierbram/Base2Tone-vim'
Plug 'chriskempson/base16-vim'
Plug 'endel/vim-github-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'josuegaleas/jay'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'owickstrom/vim-colors-paramount'
Plug 'tomasr/molokai'

" git stuff
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" search files with ack/ag
Plug 'mileszs/ack.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax/indent/ftplugins for a many languages/tools (fucks up MD)
Plug 'sheerun/vim-polyglot'

" Visual helper
Plug 'Yggdroot/indentLine'

" Autoscroll
Plug 'yuttie/comfortable-motion.vim'

" Grepper
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
call plug#end()
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
" Interpreter {
" python
let g:python3_host_prog = '/usr/bin/python3'
" }
"  Looks {
" Terminal behaviour
" Disable background color erase because of a bug in VIM which shows in kitty
" see https://github.com/kovidgoyal/kitty (search for bce)
let &t_ut=''
" Show numbers
set number
" Enable syntax highlighting
syntax enable

set background=dark

" also good: jay
colorscheme solarized8_high

" Do not hide characters in, for example, markdown mode
set conceallevel=0

" Live preview of substitutions
if has('nvim')
  set inccommand=split
endif

" Show matching brackets when text indicator is over them
set showmatch

" lang
set spelllang=de,en
setlocal dictionary=/usr/share/dict/german
setlocal dictionary+=/usr/share/dict/american-english

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣

" dont make ** to fat
let g:indentLine_setConceal = 0
" }
" Auto Commands {
" Asciidoc
au BufWritePost *.adoc silent! !head -1 % | grep autocompile && asciidoctor-pdf % || true

" Remove trailing spaces on write
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
au BufWritePre * %s/\s\+$//e

" enable spell for certain filetypes
au FileType gitcommit setlocal textwidth=72 spell
au FileType markdown setlocal spell
au FileType vimwiki setlocal spell

" Filetypes
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead Jenkinsfile  setf groovy

" Markdown
au FileType markdown setlocal cole=1

" go
au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
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
set autowrite " save when useing make
set scrolloff=3 " Start scrolling 3 lines before edge of viewport
" }
" Folding {
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=10
set nofoldenable
set foldlevel=1
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
au GUIEnter * set visualbell t_vb=
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
" Set the search scan to wrap around the file
set wrapscan
" Turn on Highlighting of search results
set hlsearch
" }
" Mappings {
let mapleader = ","
let g:mapleader = ","

" Diable this {
nnoremap Q <NOP>

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
" Movement {
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

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
" Remote highlight {
nmap <silent> <BS> :nohlsearch<CR>
" }
" Hidden stuff {
noremap <leader>lc :set list!<CR>
inoremap <leader>lc <C-o>:set list!<CR>
cnoremap <leader>lc <C-c>:set list!<CR>
" }
" Pasta {
map <leader>pp :setlocal paste!<cr>
" }
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
" Terminals {
map <leader>tt :spl term://zsh<cr>
map <leader>tv :vspl term://zsh<cr>
map <leader>T :tabe term://zsh<cr>
" }
" Buffers {
" ALT-n next buffer and list, ALT-p previous buffer
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
"nnoremap <C-n> :bnext<CR>:redraw<CR>
"nnoremap <C-p> :bprevious<CR>:redraw<CR>

" Split Screen
nnoremap <Leader>ss- :split<CR>
nnoremap <Leader>ss\| :vsplit<CR>

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
" Plugin Mappings {
" Neosnippet {
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }
" Git {
nnoremap <leader>gs :Magit<CR>
" }
" EasyMotion {
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }
" NerdTree {
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark
" map <leader>nf :NERDTreeFind<cr><Paste>
" }
" neosnippet {
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
" }
" Limelight {
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>
" }
" EasyAlign {
nmap ta <Plug>(EasyAlign)
xmap ta <Plug>(EasyAlign)
" }
" Asciidoctor-pdf {
nmap <Leader>adc :!asciidoctor-pdf %<CR>
" }
" fzf {
map <leader>fl :BLines<CR>
map <leader>ff :FZF<CR>
map <leader>fgf :GFiles<CR>
map <leader>fh :History<CR>
map <C-P> :FZF .<CR>
" }
" coc (general){
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
" nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" }
" coc-snippets {
imap <C-l> <Plug>(coc-snippets-expand)
" }
" coc-yank {
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
" }
" Grepper {
nnoremap <leader>g :Grepper -tool g<cr>
" }
" Ferret {
nmap <leader>z <Plug>(FerretAckWord)
nmap <leader>x <Plug>(FerretAck)
" }
" workspace {
nnoremap <leader>tw :ToggleWorkspace<CR>
" Don't load on vim with args
let g:workspace_session_disable_on_args = 1
" }
" scalpel {
nmap <Leader>r <Plug>(Scalpel)
" }
" coc-explorer {
nmap <Leader>e :CocCommand explorer<CR>
autocmd FileType coc-explorer unmap j
autocmd FileType coc-explorer unmap k
" }
" }
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
let g:airline_theme='Base2Tone_MeadowDark'
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
" ansible-vim {
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_syntaxes = "sh.vim python.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_extra_keywords_highlight = 1
" }
" markdown {
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'puppet']
let g:markdown_minlines = 100
let g:markdown_syntax_conceal = 0
" }
" nerdtree {
" let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.mypy_cache']
" }
" vim-wiki {
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_conceallevel = 0
" dont use vimwiki filetype for all .md files
let g:vimwiki_global_ext = 0

" default wiki
let wiki_default = {}
let wiki_default.path = '~/.vimwiki/notes'
let wiki_default.syntax = 'markdown'
let wiki_default.ext = 'md'
let wiki_default.nested_syntaxes = {'md':'markdown', 'sh':'sh','python': 'python', 'c++': 'cpp'}

let g:vimwiki_list = [wiki_default]
" }
" ale {
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚡'
let g:ale_completion_enabled = 0
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
" }
" neosnippet {
" No conceal markers
let g:neosnippet#enable_conceal_markers = 0
" }
" coc {
" Manage these extensions automatically
let g:coc_global_extensions = [ 'coc-solargraph', 'coc-go', 'coc-diagnostic', 'coc-python', 'coc-json', 'coc-html', 'coc-highlight', 'coc-snippets', 'coc-vimlsp', 'coc-texlab', 'coc-yaml', 'coc-xml', 'coc-git', 'coc-marketplace', 'coc-emoji', 'coc-dictionary', 'coc-tag', 'coc-neosnippet', 'coc-yank', 'coc-sh', 'coc-markdownlint', 'coc-explorer']

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
au CursorHold * silent call CocActionAsync('highlight')
" }
" coc-explorer {
" exit if last buffer is coc-explorer
au BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" }
" }
