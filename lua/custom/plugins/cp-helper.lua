return {
  'p00f/cphelper.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.cmd [[
		autocmd FileType Results setlocal foldlevel=5
		]]
    vim.g['cph#vsplit'] = true
  end,
}
