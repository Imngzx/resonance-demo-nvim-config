-- Optional: count the startup time from the very first line, not from the
-- moment Resonance is required. resonance.stats() reads it.
_G.start_time = vim.uv.hrtime()

require('config.keymaps')
require('config.options')
require('config.resonance')
