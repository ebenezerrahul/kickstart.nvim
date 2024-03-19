-- online pastebin integrations
return {
  'rktjmp/paperplanes.nvim',
  config = function()
    require('paperplanes').setup {
      register = '+',
      provider = '0x0.st',
      notifier = vim.notify or print,
    }
  end,
}
