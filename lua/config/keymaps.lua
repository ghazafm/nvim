local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ========================================
-- Better defaults
-- ========================================

-- Better up/down navigation with word wrap
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- ========================================
-- Register-aware operations
-- ========================================

-- Delete without affecting registers
keymap.set("n", "x", '"_x', opts)
keymap.set({ "n", "v" }, "<Leader>d", '"_d', { desc = "Delete without yank" })
keymap.set({ "n", "v" }, "<Leader>D", '"_D', { desc = "Delete line without yank" })

-- Change without affecting registers
keymap.set({ "n", "v" }, "<Leader>c", '"_c', { desc = "Change without yank" })
keymap.set({ "n", "v" }, "<Leader>C", '"_C', { desc = "Change to end without yank" })

-- Paste from yank register (0)
keymap.set("n", "<Leader>p", '"0p', { desc = "Paste from yank register" })
keymap.set("n", "<Leader>P", '"0P', { desc = "Paste before from yank register" })
keymap.set("v", "<Leader>p", '"0p', { desc = "Paste from yank register" })

-- ========================================
-- Editing
-- ========================================

-- Increment/decrement (using default <C-a>/<C-x> - removed conflict with dial.nvim)
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- Select all (using different key to avoid conflict)
keymap.set("n", "<Leader>a", "gg<S-v>G", { desc = "Select all" })

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- ========================================
-- Navigation
-- ========================================

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- ========================================
-- Window management
-- ========================================

-- Split window
keymap.set("n", "ss", ":split<Return>", { desc = "Split horizontal" })
keymap.set("n", "sv", ":vsplit<Return>", { desc = "Split vertical" })

-- Move between windows (alternative to <C-hjkl>)
keymap.set("n", "sh", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Go to right window" })

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Decrease width" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Increase width" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Increase height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Decrease height" })

-- ========================================
-- Diagnostics
-- ========================================

keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- ========================================
-- LSP Functions
-- ========================================

keymap.set("n", "<leader>ui", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- ========================================
-- Commands
-- ========================================

vim.api.nvim_create_user_command("ToggleAutoformat", function()
	require("lazyvim.util").format.toggle()
end, { desc = "Toggle autoformat on save" })
