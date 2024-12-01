return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    -- configuration options
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}

