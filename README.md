# 🔳 Telescope Box Drawing

A picker for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
that lets you choose from a selection of
[box drawing characters](https://en.wikipedia.org/wiki/Box-drawing_characters).

## 🗃️ What are Box Drawing Characters?

These characters can help you draw tables or interesting shapes. Unfortunately,
they don't look that good in GitHub markdown, but they look nice in most
terminal emulators.

```
                                with box drawing chars         using ASCII
┌───────────────╮                 ┏━━━━━━━━━━━━━━━━┓        +----------------+
│  hey, nice    │                 ┃                ┃        |                |
├┐     ╓──────╮╭╯                 ┃   ╭────┐       ┃        |   /----+       |
││┌──╖ ║      ╰╯                  ┃   │cool│       ┃        |   |lame|       |
│││  ╚═╩═════════════════╡ cool   ┃   └────╯       ┃        |   +----/       |
│││                               ┃           ┏━━━━┫        |           +----+
└┼┘                               ┃           ┃ 😎 ┃        |           | 😞 |
 ┴                                ┗━━━━━━━━━━━┻━━━━┛        +-----------+----+
wow
```

For instance, the above text looks like this in my terminal

<img width="598" height="193" alt="image" src="https://github.com/user-attachments/assets/3ab68083-7672-4379-a5cd-cf3640a8cf55" />

Check `lua/telescope-box-drawing.nvim/symbols.lua` for all the available
symbols. Or just use the extension.

## 🥡 Installation

With Lazy.nvim, use this plugin as a dependency for Telescope.

```lua
{
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nullromo/telescope-box-drawing.nvim',
    },
}
```

You can load the extension like this:

```lua
local telescope = require('telescope')
telescope.load_extension('box-drawing')
```

Once it's loaded, you can call it like this:

```lua
telescope.extensions['box-drawing']['box-drawing']()
```

Or you can simply use `:Telescope box-drawing` (with <kbd>Tab</kbd> completion).

## 🧃 Configuration

### Setting Default Options

I recommend using the `cursor` theme provided by Telescope. To set this up, you
can set the options like this in your Telescope setup.

```lua
local telescope = require('telescope')
local telescopeThemes = require('telescope.themes')

telescope.setup({
    extensions = {
        ['box-drawing'] = telescopeThemes.get_cursor({
            layout_config = { height = 20, width = 40 },
        }),
    }
})
```

This config will automatically be passed into the picker every time you call it.

### Defining a User Command

You can also create a dedicated user command like this:

```lua
local telescopeThemes = require('telescope.themes')

vim.api.nvim_create_user_command('BoxDrawing', function()
    telescope.extensions['box-drawing']['box-drawing'](
        telescopeThemes.get_cursor({
            layout_config = { height = 20, width = 40 },
        })
    )
end, { desc = 'telescope box drawing characters' })
```

## 🧰 License, Contributing, etc.

See [LICENSE](./LICENSE) and [CONTRIBUTING.md](./CONTRIBUTING.md).

I am very open to feedback and criticism.

## 🗳️ Special Thanks

- 🏅
  [`<Your name here>`](https://github.com/nullromo/telescope-box-drawing.nvim/blob/main/README.md#-donating)

## 📥 Donating

To say thanks, [sponsor me on GitHub](https://github.com/sponsors/nullromo) or
use [@Kyle-Kovacs on Venmo](https://venmo.com/u/Kyle-Kovacs). Your donation is
appreciated!
