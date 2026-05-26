-- =====================================================================
-- 🎵 Bootstrap Resonance.nvim
-- =====================================================================
local plugin_url = "https://github.com/Imngzx/resonance.nvim"
local pack_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/resonance.nvim"

if not vim.uv.fs_stat(pack_path) then
  vim.notify("🎵 Resonating (Downloading resonance.nvim)...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    plugin_url,
    "--branch=main",
    pack_path
  })
end

vim.opt.rtp:prepend(pack_path)

vim.pack.add({ plugin_url })

-- =====================================================================
-- 🚀 Configuration
-- =====================================================================
local resonance = require("resonance")

resonance.setup({
  ui = {
    border = "rounded", -- 边框样式 (可选: "none", "single", "double", "rounded", "solid", "shadow")
    width = 0.65,       -- 浮窗宽度（占屏幕百分比，0.65 = 65%）
    height = 0.75,      -- 浮窗高度（占屏幕百分比，0.75 = 75%）
  }
})

-- UI keymap binding
vim.keymap.set("n", "<leader>pL", resonance.open_ui, { desc = "Resonance UI" })

--plugins
require('plugins.test')
require('plugins.test2')
require('plugins.test3')
require('plugins.test4')


-- NOTE: must put this at the end of your init.lua!
resonance.trigger_verylazy()
