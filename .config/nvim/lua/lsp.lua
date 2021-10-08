-- COPIED FROM https://github.com/neovim/nvim-lspconfig
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space><S-q>', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>:LspDiagnostics 0<CR>', opts)
  buf_set_keymap('n', '<space>aq', '<cmd>:LspDiagnosticsAll<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --Stuff that is replaced by LSPSAGA
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)



------------- LSP SAGA -------------
--YET EXPERIMENTAL... I'm not yet convinced of LSP-SAGA....
  buf_set_keymap('n', '<C-f>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap('n', '<C-b>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)
  buf_set_keymap('n', 'gh', ":Lspsaga lsp_finder<CR>", opts)
  buf_set_keymap('n', '<space>ca', ":Lspsaga code_action<CR>", opts)
  buf_set_keymap('v', '<space>ca', ":<C-U>Lspsaga range_code_action<CR>", opts)
  buf_set_keymap('n', 'K', ":Lspsaga hover_doc<CR>", opts)
  buf_set_keymap('n', '<C-k>', ":Lspsaga signature_help<CR>", opts)
  buf_set_keymap('i', '<C-k>', ":Lspsaga signature_help<CR>", opts)
  buf_set_keymap('n', '<space>rn', ':Lspsaga rename<CR>', opts)
  buf_set_keymap('n', 'fd', ':Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<space>ld', ':Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>cd', ':Lspsaga show_cursor_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>nd', ':Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<space>pd', ':Lspsaga diagnostic_jump_prev<CR>', opts)
  -- Buggy float term.... and thats not unixy
  --buf_set_keymap('n', '<A-d>', ':Lspsaga open_floaterm<CR>', opts)
  --buf_set_keymap('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', opts)

  --TODO: More: <Del>https://github.com/glepnir/lspsaga.nvim

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "tsserver", "gdscript", "hls", "angularls", "texlab" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp["rust_analyzer"].setup { 
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			["cargo"] = {
				["runBuildScripts"] = true
			},
			["assist"] = {
				importGranularity = "module",
				importPrefix = "by_self"
			}
		},
	}
}

nvim_lsp["svelte"].setup {
	settings = {
		cmd = {'forksvelteserver', '--stdio'}
	}
}

local lspconfig = require'lspconfig'
lspconfig.ccls.setup {}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)



require'lspsaga'.init_lsp_saga{
 --https://github.com/Samantha-uk/lspsaga.nvim
}
