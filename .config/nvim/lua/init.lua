vim.g.mapleader = ' '

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

cmd 'packadd paq-nvim'               	-- load the package manager
local paq = require('paq-nvim').paq  	-- a convenient alias
paq {'savq/paq-nvim', opt = true}    	-- paq-nvim manages itself
paq {'hrsh7th/nvim-compe'} 		-- autocompletion	
paq {'nvim-treesitter/nvim-treesitter'} -- something with hightlighting i guess?
paq {'neovim/nvim-lspconfig'} 		-- Automagic configs for several lsps

paq {'junegunn/fzf.vim'} 		-- GUI for FZF
paq {'ojroques/nvim-lspfuzzy'} 		-- FZF integration for lsp (go to implementations and such)

paq {'cohama/lexima.vim'}
paq {'phaazon/hop.nvim'}
paq {'norcalli/nvim-colorizer.lua'}

paq {'glepnir/lspsaga.nvim'}

-- File Tree
paq { 'kyazdani42/nvim-web-devicons' }
paq {'kyazdani42/nvim-tree.lua'}


paq {'iamcco/markdown-preview.nvim', run ="cd app && npm install"}

-- paq {'sainnhe/gruvbox-material'}   	-- Theme


--Git Stuff
paq {'tpope/vim-fugitive'} --Replace with https://github.com/TimUntersberger/neogit
paq {'airblade/vim-gitgutter'}

-- Writing
paq { 'rhysd/vim-grammarous' }

paq { 'junegunn/goyo.vim' }
paq { 'junegunn/limelight.vim' }

-----------------------------------------------------------
-- TODO: hop.nvim Shortcuts
--
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

--- SETUP THESE PLUGINS YEE---
require('lspfuzzy').setup{
	methods='all'
}

require('.lsp')
require('.compesettings')

require('.keymapping')



-- NVIM Tree
-- vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_git_hl = 0 --Cuz I got icons
require('nvim-tree').setup{
	lsp_diagnostics = 1,
	tree_follow= 1
}

--- MarkdownPreview
vim.g.mkdp_browser = 'firefox'

---- https://neovim.io/doc/user/lua.html#vim.o
vim.wo.wrap = false
vim.wo.number = true
-- vim.wo.rnu = true

vim.o.signcolumn = "yes"

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true


vim.o.hidden = true --Do not force a save when switching buffers

--- Configure Palette
vim.o.termguicolors = true
vim.o.background="dark"
-- vim.cmd[[colorscheme gruvbox-material]]


require('colorizer').setup{}

--- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

vim.g.formatdef_rustfmt = '"rustfmt"'
vim.g.formatters_rust = {'rustfmt'}


--- Vim Git Stff
opt.updatetime=100 --gitgutter: run git status 100ms after :w

-- RESOURCES:
-- https://github.com/mjlbach/defaults.nvim/blob/master/init.lua
