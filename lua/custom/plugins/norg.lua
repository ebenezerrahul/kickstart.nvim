return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  opts = {
    load = {
      -- ['core.latex.renderer'] = {},
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.export'] = {}, -- Adds pretty icons to your documents
      ['core.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/notes',
          },
          default_workspace = 'notes',
        },
      },
    },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', 'luarocks.nvim', '3rd/image.nvim' },
    {
      'folke/tokyonight.nvim',
    },
  },
}
