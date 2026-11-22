# resonance.nvim demo config

A small Neovim config that shows how [resonance.nvim](https://github.com/Imngzx/resonance.nvim)
is used: one spec per file, each plugin on its own trigger.

Needs Neovim 0.13 nightly (`vim.pack`), `git`, and a C compiler for the
treesitter parsers.

## Try it without touching your own config

`NVIM_APPNAME` gives this config its own directories, so your usual
`~/.config/nvim` and its plugins are left alone:

```sh
git clone https://github.com/Imngzx/resonance-demo-nvim-config ~/.config/resonance-demo
NVIM_APPNAME=resonance-demo nvim
```

The first start installs everything. Press `<Space>pL` (or `:Resonance`) to
open the panel and see what loaded and why.

To remove it again:

```sh
rm -rf ~/.config/resonance-demo ~/.local/share/resonance-demo \
       ~/.local/state/resonance-demo ~/.cache/resonance-demo
```

## Layout

```text
.
├── init.lua                  options, keymaps, then Resonance
├── lua
│   ├── config
│   │   ├── keymaps.lua
│   │   ├── options.lua
│   │   └── resonance.lua     installs Resonance, imports lua/plugins/
│   └── plugins               one file per plugin, each returns its spec
│       ├── ascetic.lua
│       ├── colorscheme.lua
│       ├── futa-ri.lua
│       ├── icons.lua
│       ├── jisho.lua
│       ├── snacks.lua
│       └── treesitter.lua
└── nvim-pack-lock.json       the commits vim.pack installed
```

## What each plugin shows

| File | Trigger | Loads |
|---|---|---|
| `colorscheme.lua` | `lazy = false`, `priority = 1000` | at startup, before the others |
| `snacks.lua` | `lazy = false` | at startup, for the dashboard |
| `ascetic.lua` | `event = { 'BufReadPost', 'BufNewFile' }` | when a file is opened |
| `treesitter.lua` | `event` + `build` | when a file is opened; `:TSUpdate` runs on install and update |
| `futa-ri.lua` | `event = 'InsertEnter'` | on entering insert mode |
| `icons.lua` | `lazy = true` | on `VeryLazy`, once the UI is up; also stands in for nvim-web-devicons |
| `jisho.lua` | `cmd` + `keys` | on the first `:Jisho` or `<Space>tj` |

The dashboard shows `resonance.stats()`: how many plugins are loaded and how
long startup took.

`nvim-pack-lock.json` pins every plugin, Resonance included, to the commit
it was tested with. Run `:lua vim.pack.update()` to move to the latest.
