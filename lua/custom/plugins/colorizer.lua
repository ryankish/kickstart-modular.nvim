return {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufNewFile', 'BufReadPost', 'BufWritePost' },
  opts = {
    '*', -- all filetypes
  },
}

