-- lazy = false: the dashboard has to be there when Neovim opens.
-- Resonance also sends its notifications through snacks.notifier, and the
-- panel's `D` key opens the snacks explorer.
return {
  'https://github.com/folke/snacks.nvim',
  lazy = false,
  setup = function()
    local snacks = require('snacks')

    snacks.setup({
      notifier = { enabled = true, timeout = 3000 },
      picker = { enabled = true },
      explorer = { enabled = true },
      terminal = { enabled = true },
      scroll = {
        enabled = true,
        animate = { duration = { step = 10, total = 50 }, easing = 'linear' },
      },
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = '󰒲 ', key = 'l', desc = 'Resonance UI', action = ':Resonance' },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          -- A function, so the numbers are read when the dashboard is drawn.
          function()
            local stats = require('resonance').stats()
            return {
              align = 'center',
              text = {
                { '󱐋 ', hl = 'Special' },
                { ('%d / %d'):format(stats.loaded, stats.count), hl = 'Special' },
                { ' plugins loaded in ', hl = 'Comment' },
                { ('%.2f ms'):format(stats.startuptime), hl = 'Special' },
              },
              padding = 1,
            }
          end,
        },
      },
    })

    vim.keymap.set('n', '<leader>e', function() snacks.explorer() end, { desc = 'File Explorer' })
    vim.keymap.set('n', '<leader><space>', function() snacks.picker.smart() end, { desc = 'Smart Find' })
    vim.keymap.set('n', '<leader>/', function() snacks.picker.grep() end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>pT', function() snacks.terminal() end, { desc = 'Toggle Terminal' })
    vim.keymap.set('n', '<leader>bd', function() snacks.bufdelete() end, { desc = 'Delete Buffer' })
  end,
}
