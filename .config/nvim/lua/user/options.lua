local o = vim.opt

local options = {
	title = true, -- always set terminal title
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	encoding = "utf-8", -- general encoding
	-- termencoding = "utf-8",                  -- terminal encoding
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "", -- death to all rodents!
	pumheight = 10, -- pop up menu height
	textwidth = 100, -- break lines at 100 characters per default
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 1, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	-- termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	undolevels = 1000, -- set max undo level (how many things are we able to undo?)
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	hidden = true, -- do not bother me when switching from an unsaved buffer
	wrap = true, -- do not display lines as one long line
	scrolloff = 8, -- is one of my fav
	inccommand = "split", -- live preview of substitutions
	virtualedit = "block", -- allow cursor to move where there is no text in visual block mode
	sidescrolloff = 8,
	joinspaces = false, -- don't autoinsert two spaces after '.', '?', '!' for join command
	autowrite = true, -- automativcally save when building through e.g. make
	spelllang = "de,en", -- default set of languages for spellchecks
	showmatch = true, -- show matching brackets when text indicator is over them
	backspace = "2", -- allow backspacing over indent, eol, and the start of an insert
	history = 1000, -- sets how many lines of history VIM has to remember
	incsearch = true, -- search incrementally and highlight search hits
	wrapscan = true, -- set the search scan to wrap around the file
	fillchars = "vert:│", -- make vertical bar more pleasing to the eye
	foldmethod = "syntax", -- enable folding on syntax level
	foldlevelstart = 1, -- start folding early
	foldnestmax = 10, -- only 10 levels
	foldenable = false, -- enable folding globally
	foldlevel = 1,
	listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣",
	winbar = "%=%m %f",
}

-- some global netrw settings
vim.g.netrw_banner = 0 -- disable annoying banner
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_altv = 1 -- open splits to the right
vim.g.netrw_liststyle = 3 -- tree view
vim.cmd([[
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=",\(^\|\s\s\)\zs\.\S\+"
]])

-- format options
o.formatoptions:append("j") -- delete comment leader on J
o.formatoptions:append("n") -- delete leading number on J (useful with numbered list)"
o.shortmess:append("c") -- don't pass messages to |ins-completion-menu|.

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set iskeyword+=-,_,$,@,%,#") -- none of these are word dividers
