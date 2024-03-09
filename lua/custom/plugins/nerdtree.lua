return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    vim.keymap.set('n', '<leader><leader>t', require('nvim-tree.api').tree.toggle)
    -- vim.keymap.set('n', '<C-t>', require('nvim-tree.api').tree.change_root_to_parent)
    vim.keymap.set('n', '?', require('nvim-tree.api').tree.toggle_help)
    require('nvim-tree').setup {}
  end,
}
