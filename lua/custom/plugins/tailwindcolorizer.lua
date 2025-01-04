return {
  'themaxmarchuk/tailwindcss-colors.nvim',
  lazy = true,
  module = 'tailwindcss-colors',
  config = function()
    -- pass config options here (or nothing to use defaults)
    require('tailwindcss-colors').setup()
  end,
}
