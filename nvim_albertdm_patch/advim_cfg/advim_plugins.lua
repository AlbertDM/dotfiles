-- AlbertDM Vim Plugins

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq { 'jayli/vim-easycomplete' }
paq { 'SirVer/ultisnips' }
