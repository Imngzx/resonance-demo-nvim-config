-- lazy = false: the colorscheme loads at startup, before anything else.
return {
  'https://github.com/catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000, -- imported first
  setup = function()
    require('catppuccin').setup({
      flavour = 'mocha', -- mocha, frappe, macchiato, latte
      transparent_background = false,
      integrations = {
        snacks = true,
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {
          CursorLineNr = { bold = true },
          LineNr = { fg = colors.surface1 },
          -- Floating windows without a background, with a coloured border.
          NormalFloat = { bg = 'NONE' },
          FloatBorder = { bg = 'NONE', fg = colors.pink },
          FloatTitle = { bg = 'NONE' },
        }
      end,
    })
    vim.cmd.colorscheme('catppuccin')
  end,
}
