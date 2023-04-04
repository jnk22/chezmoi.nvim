# chezmoi.nvim

This plugin allows to use several [chezmoi](https://www.chezmoi.io/) commands inside
Neovim.

⚡ This plugin is **WIP** and should only be used with caution! ⚡

## Installation

This plugin has no configurable parameters yet.

```lua
{
  "jnk22/chezmoi.nvim",
  dependencies = { "folke/plenary.nvim" },
  config = true,
}
```

## Usage

**Warning:** All commands are using the parameter `--force` for now.
Only run those if you know what you are doing!

- `:ChezmoiAdd` Add current file as-is to dotfiles.
- `:ChezmoiApply` Overwrite current file with source file.
- `:ChezmoiDiff` Print diff output of current and source file.
- `:ChezmoiEdit` Open source file in new buffer.
- `:ChezmoiReplace` Remove current and source file.
