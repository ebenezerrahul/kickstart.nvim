return {
  'startup-nvim/startup.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    require('startup').setup { theme = 'startify' }
  end,
}
