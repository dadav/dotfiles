" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :'

" Bootstrap {
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" }
" Plugins {
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Show current location in yaml hierarchy
Plug 'Einenlum/yaml-revealer'

" show hex colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" LSP code completion/diagnostics
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fancy start screen
Plug 'mhinz/vim-startify'

" easymotion
Plug 'easymotion/vim-easymotion'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" ultisnipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Better word replacer within a file
Plug 'wincent/scalpel'

" Briefly highlight the yanked region
Plug 'machakann/vim-highlightedyank'

" Just press return to replay last macro
Plug 'wincent/replay'

" multi-cursor FTW
Plug 'terryma/vim-multiple-cursors'

" fuzzy file completion, me gusta!
Plug 'ctrlpvim/ctrlp.vim'

" A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Highlight ugly extra whitespace
Plug 'ntpeters/vim-better-whitespace'

" fuzz all the things
Plug 'junegunn/fzf.vim'

" puppet
Plug 'rodjek/vim-puppet'

" tpope FTW
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

" Languages
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tmux-plugins/vim-tmux'

" themes
Plug 'atelierbram/Base2Tone-vim'
Plug 'chriskempson/base16-vim'
Plug 'endel/vim-github-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'bluz71/vim-nightfly-guicolors'
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

" airline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax/indent/ftplugins for a many languages/tools (fucks up MD)
Plug 'sheerun/vim-polyglot'

" Visual helper
Plug 'Yggdroot/indentLine'

" Autoscroll
Plug 'yuttie/comfortable-motion.vim'

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

" enables 24-bit RGB color in the TUI
set termguicolors

" also good: jay
" if exists('$TMUX')
"     colorscheme jay
" else
"     colorscheme solarized8_high
" endif
colorscheme jay

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
set spellsuggest=best,3
setlocal dictionary=/usr/share/dict/german
setlocal dictionary+=/usr/share/dict/american-english

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣

" dont hide stuff
let g:indentLine_setConceal = 0
" }
" Auto Commands {
" Asciidoc
au BufWritePost *.adoc silent! !head -1 % | grep autocompile && asciidoctor-pdf % || true

" m3u syntax highlighting
autocmd BufEnter *.m3u\(8\|\) setlocal filetype=m3u

" Remove trailing spaces on write
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
fun! StripWS()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
au BufWritePre * :call StripWS()

" enable spell for certain filetypes
au FileType gitcommit setlocal textwidth=72 spell
au FileType markdown setlocal spell

" Filetypes
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead Jenkinsfile  setf groovy
au BufNewFile,BufRead *.smali  setf smali

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
" set textwidth=80        " break lines when line length increases
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
nnoremap <leader>ss- :split<CR>
nnoremap <leader>ss\| :vsplit<CR>

" Resize
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }
" Nifty tricks {
" Write files as root
cmap w!! w !sudo tee > /dev/null %

" Plugin Mappings {
" Git {
nnoremap <leader>gg :Magit<CR>
" }
" EasyMotion {
" <Leader>f{char} to move to {char}
map  <leader>mc <Plug>(easymotion-bd-f)
nmap <leader>mc <Plug>(easymotion-overwin-f)

" Move to line
map <leader>ml <Plug>(easymotion-bd-jk)
nmap <leader>ml <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>mw <Plug>(easymotion-bd-w)
nmap <leader>mw <Plug>(easymotion-overwin-w)
" }
" EasyAlign {
nmap <leader>ta <Plug>(EasyAlign)
xmap <leader>ta <Plug>(EasyAlign)
" }
" fzf {
"
" use bat preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" use bat preview
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=never --smart-case -- '.shellescape(<q-args>), 1,
    \   {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

map <leader>fl  :BLines<CR>
map <leader>fc  :Colors<CR>
map <leader>ff  :Files<CR>
map <leader>fgf :GFiles<CR>
map <leader>fg  :Rg<space>
map <leader>fh  :History<CR>
map <C-P> :FZF .<CR>
" }
" coc (general){
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ctd <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> H :call ShowDocumentation()<CR>

" Format whole doc
nnoremap <silent> <leader>f :call CocAction('format')<CR>

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
" }
" coc-snippets {
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)
" }
" coc-yank {
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
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
" UltiSnips {
let g:UltiSnipsExpandTrigger="<Nul>"
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
" coc {
" Manage these extensions automatically
let g:coc_global_extensions = [ 'coc-solargraph', 'coc-go', 'coc-diagnostic', 'coc-json', 'coc-html', 'coc-highlight', 'coc-snippets', 'coc-vimlsp', 'coc-texlab', 'coc-xml', 'coc-git', 'coc-marketplace', 'coc-emoji', 'coc-tag', 'coc-yank', 'coc-sh', 'coc-markdownlint', 'coc-explorer', 'coc-emoji', '@yaegassy/coc-ansible', '@yaegassy/coc-ruff', 'coc-yaml', 'coc-rust-analyzer', 'coc-pyright']
let g:coc_filetype_map = {
 \ 'yaml.ansible': 'ansible',
 \ }

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

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    if coc#float#has_float()
      call coc#float#jump()
      nnoremap <buffer> q <Cmd>close<CR>
    else
      call CocActionAsync('doHover')
    endif
  else
    call feedkeys('H', 'in')
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