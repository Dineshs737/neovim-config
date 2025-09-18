# Modern Neovim Configuration for Web & Backend Development

A comprehensive Neovim configuration that provides an IDE-like experience for modern development, supporting multiple languages and frameworks.

## Requirements

### System Requirements

- Neovim >= 0.8.0
- Git
- A Nerd Font for icons (recommended: JetBrainsMono Nerd Font)
- Node.js >= 14 (for LSP servers)
- Python 3 (for certain plugins and LSP)
- `gcc`/`clang` for treesitter compilation
- `ripgrep` for Telescope live grep functionality

### Language-Specific Requirements

For full functionality, the following language servers and tools should be installed:

- JavaScript/TypeScript: `node`, `npm`
- Python: `python3`, `pip`
- Go: `go`
- Rust: `rustc`, `cargo`
- C/C++: `gcc`/`clang`
- Java: `java`, `javac`
- PHP: `php`
- Lua: `lua`

## Installation

1. Backup your existing Neovim configuration:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. Clone this configuration:

```bash
git clone git@github.com:Dineshs737/neovim-config.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

4. The configuration will automatically:
   - Bootstrap lazy.nvim (plugin manager)
   - Install all plugins
   - Set up LSP servers via Mason

5. Run the following commands:
   - `:Lazy sync` to ensure all plugins are installed
   - `:Mason` to install/manage LSP servers
   - `:checkhealth` to verify your setup

## Features

### Languages & Frameworks Support

- JavaScript/TypeScript
- React, Vue, Svelte
- Python
- Go
- Rust
- Java
- PHP
- C/C++
- HTML/CSS
- JSON/YAML
- Markdown
- and more...

### IDE Features

- 🔍 Fuzzy Finding (Telescope)
- 📁 File Explorer (Nvim-tree)
- 🔤 Auto-completion (nvim-cmp)
- 📝 LSP Support
- 🎨 Code Formatting
- 🔍 Linting
- 💡 Git Integration
- 💻 Integrated Terminal
- 🔤 Smart Comments
- 📦 Syntax Highlighting (Treesitter)
- 🎯 Auto Pairs
- 🔄 Surround Selections

## Keyboard Shortcuts

### General

- `<Space>` - Leader key
- `<Esc>` - Clear search highlights

### File Explorer (NvimTree)

- `<leader>e` - Toggle file explorer
- `<leader>o` - Focus file explorer

### Fuzzy Finding (Telescope)

- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Find references
- `<leader>fs` - Find symbols

### LSP

- `gD` - Go to declaration
- `gd` - Go to definition
- `K` - Hover documentation
- `gi` - Go to implementation
- `<C-k>` - Signature help
- `<leader>rn` - Rename
- `<leader>ca` - Code action
- `gr` - References
- `<leader>f` - Format document

### Diagnostics

- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>q` - Diagnostic list

### Buffer Navigation

- `<leader>bp` - Previous buffer
- `<leader>bn` - Next buffer
- `<leader>bd` - Delete buffer

### Window Navigation

- `<C-h>` - Move to left window
- `<C-j>` - Move to window below
- `<C-k>` - Move to window above
- `<C-l>` - Move to right window

### Window Resizing

- `<C-Up>` - Increase window height
- `<C-Down>` - Decrease window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

### Git

- `<leader>gp` - Preview hunk
- `<leader>gt` - Toggle line blame

### Terminal

- `<C-\>` - Toggle floating terminal

### clipboard

### Option 1 (RECOMMENDED): Leader key

- `<Space + y>` to copy
- `<Space + p>` to paste

### Option 2: Simple Ctrl combinations

- `<Ctrl + c>` to copy
- `<Ctrl + v>` to paste

### Option 3: Function keys

- `<F2>` to copy

- `<F3>` to paste

## Customization

The configuration is modular and can be customized:

1. Plugin Management:
   - Edit `lua/plugins.lua` to add/remove plugins
   - Run `:Lazy sync` after changes

2. LSP Configuration:
   - Use `:Mason` to install additional language servers
   - Configure in the LSP section of the config

3. Keymaps:
   - Add/modify keymaps in the keymaps section
   - Use `<leader>` (space) as the prefix for custom mappings

## Troubleshooting

### Common Issues

1. Icons not displaying correctly:
   - Install a Nerd Font
   - Configure your terminal to use the Nerd Font

2. LSP not working:
   - Run `:LspInfo` to check server status
   - Ensure language servers are installed via `:Mason`
   - Check language server requirements (e.g., Node.js for TypeScript)

3. Telescope grep not working:
   - Install `ripgrep` (`rg`)

4. Treesitter errors:
   - Run `:TSUpdate` to update parsers
   - Ensure C compiler is installed

## Updating

1. Update plugins:

   ```
   :Lazy update
   ```

2. Update LSP servers:

   ```
   :Mason update
   ```

3. Update Treesitter parsers:
   ```
   :TSUpdate
   ```

## Credits

This configuration includes and configures the following major plugins:

- lazy.nvim
- nvim-lspconfig
- nvim-cmp
- telescope.nvim
- nvim-treesitter
- nvim-tree.lua
- gitsigns.nvim
- and many more...

## Contributing

Feel free to submit issues and enhancement requests!

## License

[MIT License](LICENSE)
