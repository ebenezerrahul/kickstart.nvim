-- online pastebin integrations
return {
  'rktjmp/paperplanes.nvim',
  config = function()
    require('paperplanes').setup {
      register = '+',
      provider = 'gist',
      provider_options = {
        command = 'gh',
      },
      notifier = vim.notify or print,
    }
  end,
}
