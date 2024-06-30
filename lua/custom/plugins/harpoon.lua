return {
  'ThePrimeagen/harpoon',
  config = function()
    require('harpoon').setup {}
    vim.keymap.set('n', '<leader>m', function()
      require('harpoon.mark').add_file()
    end)
    vim.keymap.set('n', '<M-;>', function()
      require('harpoon.ui').nav_next()
    end)
    vim.keymap.set('n', '<M-,>', function()
      require('harpoon.ui').nav_prev()
    end)
    vim.keymap.set('n', '<M-f>', function()
      require('harpoon.ui').toggle_quick_menu()
    end)
  end,
}
