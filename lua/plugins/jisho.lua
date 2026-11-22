-- cmd + keys: loads on the first :Jisho or the first <leader>tj.
return {
  'https://github.com/Imngzx/jisho.nvim',
  cmd = 'Jisho',
  keys = {
    -- The order is { mode, lhs, rhs, opts }.
    { 'n', '<leader>tj', function() require('jisho').search() end, { desc = 'Jisho (word under cursor)' } },
    {
      'v',
      '<leader>tj',
      function()
        local lines = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'))
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
        require('jisho').search(table.concat(lines, ' '))
      end,
      { desc = 'Jisho (selection)' },
    },
  },
  setup = function()
    require('jisho').setup({
      use_budoux = false,
      layout = 'spacious',
    })
  end,
}
