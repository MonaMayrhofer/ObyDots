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

-- Clear search
map('n', '<C-h>', ':nohlsearch<Cr>')
