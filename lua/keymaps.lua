-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Split window management (https://github.com/bcampolo/nvim-starter-kit/blob/python/.config/nvim/lua/core/keymaps.lua)vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal window widths' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close split window' })
vim.keymap.set('n', '<leader>sj', '<C-w>-', { desc = 'Increase height' })
vim.keymap.set('n', '<leader>sk', '<C-w>+', { desc = 'Decrease height' })
vim.keymap.set('n', '<leader>sl', '<C-w>>5', { desc = 'Increase width' })
vim.keymap.set('n', '<leader>sh', '<C-w><5', { desc = 'Decrease width' })

-- Yank file name
vim.keymap.set('n', '<leader>yfn', function()
  local filename = vim.fn.expand '%:t:r'
  vim.fn.setreg('+', filename)
  vim.notify('Yanked file name without extension: ' .. filename)
end, { desc = 'Yank file name without extension' })

-- Yank file name with extension
vim.keymap.set('n', '<leader>yfe', function()
  local filename = vim.fn.expand '%:t'
  vim.fn.setreg('+', filename)
  vim.notify('Yanked file name with extension: ' .. filename)
end, { desc = 'Yank file name with extension' })

-- Yank file relative path
vim.keymap.set('n', '<leader>yfp', function()
  local filepath = vim.fn.expand '%'
  vim.fn.setreg('+', filepath)
  vim.notify('Yanked file path: ' .. filepath)
end, { desc = 'Yank file path' })

-- Yank file absolute path
vim.keymap.set('n', '<leader>yfa', function()
  local filepath = vim.fn.expand '%:p'
  vim.fn.setreg('+', filepath)
  vim.notify('Yanked absolute file path: ' .. filepath)
end, { desc = 'Yank absolute file path' })

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

vim.keymap.set('n', '<leader>p', function()
  local pdf_path = vim.fn.expand '%:p:r' .. '.pdf'
  vim.notify('Opening PDF at: ' .. pdf_path) -- Notify instead of print
  vim.cmd('silent !zathura ' .. pdf_path .. ' &')
end, { silent = true })

-- refactoring
vim.keymap.set('x', '<leader>re', ':Refactor extract ', { desc = '[R]efactor [E]xtract' })
vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ', { desc = '[R]efactor extract to [F]ile' })

vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ', { desc = '[R]efactor extract [V]ariable' })

vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var', { desc = '[R]efactor [I]nline variable' })

vim.keymap.set('n', '<leader>rI', ':Refactor inline_func', { desc = '[R]efactor [I]nline function' })

vim.keymap.set('n', '<leader>rb', ':Refactor extract_block', { desc = '[R]efactor extract [B]lock' })
vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file', { desc = '[R]efactor extract [B]lock to [F]ile' })

vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
  require('telescope').extensions.refactoring.refactors()
end)

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set('n', '<leader>rp', function()
  require('refactoring').debug.printf { below = false }
end)

-- Print var

vim.keymap.set({ 'x', 'n' }, '<leader>rv', function()
  require('refactoring').debug.print_var()
end)
-- Supports both visual and normal mode

vim.keymap.set('n', '<leader>rc', function()
  require('refactoring').debug.cleanup {}
end)
-- Supports only normal mode

-- vim: ts=2 sts=2 sw=2 et
