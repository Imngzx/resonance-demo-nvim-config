local resonance = require('resonance')

resonance.load({
  plugin = 'https://github.com/Imngzx/ascetic.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  -- event = { 'User', pattern = 'VeryLazy' },
  setup = function()
    local Ascetic = require('ascetic')

    Ascetic.setup({
      enabled = true,
      smart_j_k = true,
      threshold = 10,
      timeout = 2000,
      message = function(key)
        local insults = {
          j = 'Down down down... use `C-d` bro!',
          k = 'Up up up... use `C-u` instead!',
        }
        return insults[key] or ('Stop pressing `%s`!'):format(key)
      end,
    })
    vim.keymap.set('n', '<leader>ua', Ascetic.toggle, { desc = 'Toggle Ascetic' })
  end
})
