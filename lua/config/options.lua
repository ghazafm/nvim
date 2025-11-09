-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- Better for navigation

-- Window
vim.opt.title = true
vim.opt.cmdheight = 0 -- Modern Neovim supports this
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showcmd = true
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override ignorecase if search contains capitals
vim.opt.inccommand = "split" -- Preview substitutions live

-- Scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Backup and Undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Completion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- Split windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- Line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true -- Wrap at word boundaries

-- Backspace behavior
vim.opt.backspace = { "start", "eol", "indent" }

-- File finding
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/dist/*", "*/build/*" })

-- Backupskip
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

-- Mouse support
vim.opt.mouse = "a"

-- Shell
vim.opt.shell = "fish"

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Update time
vim.opt.updatetime = 200 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequences

-- Terminal colors
vim.opt.termguicolors = true

-- Sign column
vim.opt.signcolumn = "yes" -- Always show sign column to prevent shift

-- Cursor line
vim.opt.cursorline = true

-- Format options
vim.opt.formatoptions = "jcroqlnt" -- Better default format options

-- Session options
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Grep program
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep"
	vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Undercurl support
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- File type specific settings
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- File types (MDX handled here, not in treesitter)
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})
vim.treesitter.language.register("markdown", "mdx")

-- LazyVim settings
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"
