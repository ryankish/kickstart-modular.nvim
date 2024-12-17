-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function(_, opts)
    -- Add configuration to show hidden files
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
    opts.filesystem.filtered_items.hide_dotfiles = false
    opts.filesystem.filtered_items.hide_gitignored = false
    opts.filesystem.filtered_items.never_show = {
      '__pycache__',
      '.DS_Store',
    }
    opts.filesystem.window = opts.filesystem.window or {}
    opts.filesystem.window.mappings = opts.filesystem.window.mappings or {}
    opts.filesystem.window.mappings['\\'] = 'close_window'

    opts.filesystem.window.mappings['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } }
    opts.filesystem.window.mappings['<C-b>'] = { 'scroll_preview', config = { direction = 10 } }
    opts.filesystem.window.mappings['<C-f>'] = { 'scroll_preview', config = { direction = -10 } }

    require('neo-tree').setup(vim.tbl_deep_extend('force', opts, {
      close_if_last_window = true,
    }))
  end,
}
