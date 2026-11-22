-- =====================================================================
-- 🎵 Install Resonance.nvim
-- =====================================================================
-- vim.pack installs Resonance itself. Every other plugin goes through
-- Resonance, which gives it its triggers.
vim.pack.add({ 'https://github.com/Imngzx/resonance.nvim' })

-- =====================================================================
-- 🚀 Configuration
-- =====================================================================
local resonance = require('resonance')

resonance.setup({
  ui = {
    border = 'rounded', -- 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
    width = 0.65,       -- share of the screen width
    height = 0.75,      -- share of the screen height
  },
})

vim.keymap.set('n', '<leader>pL', '<cmd>Resonance<cr>', { desc = 'Resonance UI' })

-- One spec per file in lua/plugins/. Each file returns its spec.
resonance.import('plugins')
