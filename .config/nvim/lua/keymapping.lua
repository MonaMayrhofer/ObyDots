local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- FZF Stuff
map('n', '<S-p>', ':Buffers<Cr>')
map('n', '<M-p>', ':Commands<Cr>')
map('n', '<C-p>', ':Files<Cr>')
map('n', '<C-f>', ':Rg<Cr>')
map('n', '<C-y>', ':NvimTreeToggle<Cr>')

-- Clear search
map('n', '<C-h>', ':nohlsearch<Cr>')



local cmd = vim.cmd

----- AUTOCOMMANDS -----
-- Automatic Format on Save...
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
vim.cmd([[ au BufWritePre *.rs :Format ]])
vim.cmd([[ au BufWritePre *.js :Format ]])
vim.cmd([[:command ToggleRelativeLineNumbers :set rnu!]])


-- Hop.nvim
map('n', '<C-l>', ':HopWord<Cr>')
map('i', '<C-l>', '<C-o>:HopWord<Cr>')
