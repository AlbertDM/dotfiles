-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local opt = vim.opt  -- to set options
local set = vim.opt  -- to set options
local g = vim.g
local wo = vim.wo
local bo = vim.bo

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end



-- VIM_KEYS: Remap of basic keys !!!

-- Change leader to a comma
-- <leader> = , 
vim.g.mapleader = ','

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
-- "" no one is really happy until you have this shortcuts
-- cnoreabbrev W! w!
-- cnoreabbrev Q! q!
-- cnoreabbrev Qall! qall!
-- cnoreabbrev Wq wq
-- cnoreabbrev Wa wa
-- cnoreabbrev wQ wq
-- cnoreabbrev WQ wq
-- cnoreabbrev W w
-- cnoreabbrev Q q
-- cnoreabbrev Qall qall
--

-------------------- PLUGINS -------------------------------
-- cmd 'packadd paq-nvim'               -- load the package manager
-- local paq = require('paq-nvim').paq  -- a convenient alias
-- paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
-- paq {'shougo/deoplete-lsp'}
-- paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
-- paq {'nvim-treesitter/nvim-treesitter'}
-- paq {'neovim/nvim-lspconfig'}
-- paq {'junegunn/fzf', run = fn['fzf#install']}
-- paq {'junegunn/fzf.vim'}
-- paq {'ojroques/nvim-lspfuzzy'}
-- g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

-------------------- OPTIONS -------------------------------
-- cmd 'colorscheme desert'            -- Put your favorite colorscheme here
-- opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
-- opt.expandtab = true                -- Use spaces instead of tabs
-- opt.hidden = true                   -- Enable background buffers
-- opt.ignorecase = true               -- Ignore case
-- opt.joinspaces = false              -- No double spaces with join
-- opt.list = true                     -- Show some invisible characters
-- opt.number = true                   -- Show line numbers
-- opt.relativenumber = true           -- Relative line numbers
-- opt.scrolloff = 4                   -- Lines of context
-- opt.shiftround = true               -- Round indent
-- opt.shiftwidth = 2                  -- Size of an indent
-- opt.sidescrolloff = 8               -- Columns of context
-- opt.smartcase = true                -- Do not ignore case with capitals
-- opt.smartindent = true              -- Insert indents automatically
-- opt.splitbelow = true               -- Put new windows below current
-- opt.splitright = true               -- Put new windows right of current
-- opt.tabstop = 2                     -- Number of spaces tabs count for
-- opt.termguicolors = true            -- True color support
-- opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
-- opt.wrap = false                    -- Disable line wrap




-----------------------------------------------------------
-- Neovim shortcuts Mapping
-----------------------------------------------------------

-- MOVING: Cursors and arrows

-- Disable arrow keys
-- map('', '<up>', '<nop>')
-- map('', '<down>', '<nop>')
-- map('', '<left>', '<nop>')
-- map('', '<right>', '<nop>')

-- Cursors
wo.cursorline = true
wo.nu = true
wo.rnu = true


-- Clear search highlighting with <leader> and c
-- map('n', '<leader>c', ':nohl<CR>')
map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'


-- WINDOWS: 
-- Change split orientation
-- map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
-- map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map("n", "<S-l>", [[ <Cmd> set nu! <CR>]], opt)
map("n", "<S-r>", [[ <Cmd>set relativenumber<CR>]], opt)

-------------------
-- Text mappings --
-------------------
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
-- map('', '<y', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly
map('n', 'P','"0p')       -- Paste the last yy. Not the last dd.

-- Tab as 4 spaces
-- filetype plugin indent on
-- " show existing tab with 4 spaces width
set.tabstop=4
set.softtabstop=4
-- " when indenting with '>', use 4 spaces width
set.shiftwidth=4
-- " On pressing tab, insert 4 spaces
bo.expandtab=true

-- Retab : All tabs in file => 4spaces 
-- set expandtab ts=4 sw=4 ai
-- You can replace all the tabs with spaces in the entire file with
-- :%retab

-- Clipboard --
--  :echo has('clipboard') 
--      if returns 0 : vim has not been compiled with clipboard.
--      Ubuntu: sudo apt-get install vim-gtk
-- Use ",c" instead... -- 
vim.opt.clipboard = 'unnamedplus'



-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
-- map('n', '<C-T>', ':Term<CR>', { noremap = true })  -- open
map('t', '<C-w>', '<Esc><C-\\><C-N><C-w>')          -- exit and move to next window with arrow.
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<F3>',  ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
map('n', '<F4>',      ':TagbarToggle<CR>')          -- open/close


-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}



-------------------- LSP -----------------------------------
-- local lsp = require 'lspconfig'
-- local lspfuzzy = require 'lspfuzzy'

-- We use the default settings for ccls and pylsp: the option table can stay empty
-- lsp.ccls.setup {}
-- lsp.pylsp.setup {}
-- lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-------------------- COMMANDS ------------------------------
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
