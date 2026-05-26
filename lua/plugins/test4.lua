local resonance = require('resonance')

resonance.load({
  plugin = "https://github.com/folke/snacks.nvim",
  event = { 'User', pattern = 'VeryLazy' },
  setup = function()
    -- 你的 snacks 设置
  end
})
