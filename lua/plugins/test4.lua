local resonance = require('resonance')

resonance.load({
  plugin = "https://github.com/folke/snacks.nvim",
  event = { 'User', pattern = 'VeryLazy' },
  setup = function()
    local snacks = require("snacks")

    snacks.setup({
      -- 1. 漂亮且不卡顿的通知系统
      notifier = { enabled = true, timeout = 3000 },

      -- 2. 强大的文件/搜索拾取器
      picker = { enabled = true },

      -- 3. 轻量级侧边栏文件浏览器
      explorer = { enabled = true },

      -- 4. 终端管理
      terminal = { enabled = true },

      scroll = {
        enabled = true,
        animate = { duration = { step = 10, total = 50 }, easing = 'linear' },
      },
      -- 5. 启动主页 (带 Resonance 性能统计!)
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "󰒲 ", key = "l", desc = "Resonance UI", action = ":lua require('resonance').open_ui()" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys",  gap = 1, padding = 1 },
          -- 👇 修复这里：把整个区域写成一个匿名函数，Snacks 会在渲染时调用它！
          function()
            local scanner = require("resonance.scanner")
            local info = scanner.get_info()

            local ms = 0
            if _G.start_time and _G.end_time then
              ms = (_G.end_time - _G.start_time) / 1e6
            end

            return {
              align = "center",
              text = {
                { "󱐋 ", hl = "Special" },
                { string.format("%d / %d", info.loaded, info.total), hl = "Special" },
                { " plugins loaded in ", hl = "Comment" },
                { string.format("%.2f ms", ms), hl = "Special" },
              },
              padding = 1,
            }
          end,
        }
      }
    })

    -- =======================================================
    -- ⌨️ 绑定 Snacks 常用快捷键
    -- =======================================================
    -- 文件树
    vim.keymap.set("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })

    -- 搜索相关
    vim.keymap.set("n", "<leader><space>", function() snacks.picker.smart() end, { desc = "Smart Find" })
    vim.keymap.set("n", "<leader>/", function() snacks.picker.grep() end, { desc = "Live Grep" })

    -- 终端
    vim.keymap.set("n", "<leader>pT", function() snacks.terminal() end, { desc = "Toggle Terminal" })

    -- 安全删除 Buffer
    vim.keymap.set("n", "<leader>bd", function() snacks.bufdelete() end, { desc = "Delete Buffer" })
  end
})
