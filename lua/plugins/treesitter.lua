-- event + build: loads when a file is opened; :TSUpdate runs on install
-- and on every update.
local parsers = { 'lua' }

local function setup_compiler()
  if vim.fn.has('win32') == 1 then
    vim.env.CC = 'gcc'
    vim.env.CXX = 'g++'
  end
end

return {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  version = 'main',
  event = { 'BufReadPre', 'BufNewFile' },

  build = function()
    setup_compiler()
    -- The build can run before the plugin is loaded, so load it first or
    -- :TSUpdate does not exist yet.
    vim.cmd.packadd('nvim-treesitter')
    vim.cmd('TSUpdate')
  end,

  setup = function()
    setup_compiler()
    require('nvim-treesitter').install(parsers, { summary = false })

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TreesitterAttach', { clear = true }),
      callback = function(args)
        if vim.bo[args.buf].buftype ~= '' then return end
        if vim.b[args.buf].snacks_bigfile then return end
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end
        if pcall(vim.treesitter.start, args.buf, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
