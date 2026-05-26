local resonance = require('resonance')
resonance.load({
  plugin = "https://github.com/catppuccin/nvim",
  event = { 'User', pattern = 'VeryLazy' },
  setup = function()
  end
})

vim.cmd.colorscheme('catppuccin')
