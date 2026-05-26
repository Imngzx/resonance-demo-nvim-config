_G.start_time = vim.uv.hrtime()
_G.end_time = nil

vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function()
    _G.end_time = vim.uv.hrtime()
  end
})
