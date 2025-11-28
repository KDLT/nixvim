# KDLT's Nixvim Configuration

A declarative Neovim configuration using [nixvim](https://github.com/nix-community/nixvim), designed to be used as a flake input in nix-darwin or NixOS systems.

## Features

- **Modular structure** with auto-importing plugin groups
- **LSP support** for Nix, Python, TypeScript/JavaScript, HTML, CSS, Bash, and more
- **Format-on-save** using deno_fmt (JS/TS/Markdown), prettierd (HTML), and language-specific formatters
- **Harpoon2** for quick file navigation
- **Telescope** for fuzzy finding files, grep, and more
- **Neo-tree** and **Oil** file explorers
- **Catppuccin** color scheme
- **Treesitter** for syntax highlighting and code understanding
- **Auto-completion** with nvim-cmp, luasnip, and LSP integration

## Quick Start

### Run directly from GitHub
```bash
nix run github:KDLT/nixvim
```

### Test locally
```bash
# Build the configuration
nix build .#default

# Run nixvim
nix run .

# Check for errors
nix flake check
```

### Use in nix-darwin/NixOS

Add to your flake inputs:
```nix
{
  inputs = {
    nixvim.url = "github:KDLT/nixvim";
  };
}
```

Then import the configuration module in your system configuration.

## Configuration Structure

```
config/
├── default.nix          # Entry point
├── settings/
│   ├── autocommands.nix # Auto-commands (highlight on yank)
│   ├── keymaps.nix      # Global keybindings
│   └── options.nix      # Vim options (line numbers, tabs, etc.)
└── plugins/
    ├── cmp/             # Completion (nvim-cmp, luasnip)
    ├── editor/          # Core editing (treesitter, neo-tree, oil, undotree)
    ├── git/             # Git integration (gitsigns, lazygit)
    ├── lsp/             # LSP and formatting (conform.nvim)
    ├── themes/          # Color schemes (catppuccin)
    ├── ui/              # UI enhancements (lualine, bufferline, which-key)
    └── utils/           # Utilities (telescope, harpoon, comment, trim)
```

## Key Bindings

Leader key: `<Space>`

### General
- `<Space>` - No-op (leader key)
- `<Esc>` - Clear search highlights
- `<leader>s` - Save buffer
- `<leader>|` - Split window vertically
- `<leader>-` - Split window horizontally
- `<C-h/j/k/l>` - Navigate between splits
- `<C-x>` - Close window

### File Navigation
- `<leader>e` - Toggle Neo-tree file explorer
- `<leader>t` - Open Oil file browser
- `<C-p>` - Telescope git files
- `<C-f>` - Telescope find files
- `<C-g>` - Telescope live grep
- `<leader><space>` - Telescope find files
- `<leader>/` - Telescope grep

### Harpoon (Quick File Navigation)
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<C-1>` to `<C-9>` - Jump to Harpoon file 1-9

### LSP
- `<leader>ld` - Stop LSP
- `<leader>le` - Start LSP
- `K` - Show hover documentation
- `<leader>fd` - View workspace diagnostics

### Git
- `<leader>gs` - Git status (Telescope)
- `<leader>gc` - Git commits (Telescope)

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Telescope builtins
- `<leader>b` - List buffers
- `<leader>fc` - Change colorscheme
- `<leader>fh` - Help tags
- `<leader>fk` - View keymaps
- `<leader>o` - Recently opened files

### Formatting
Format happens automatically on save. To disable:
- `:FormatDisable` - Disable globally
- `:FormatDisable!` - Disable for current buffer only
- `:FormatEnable` - Re-enable
- `:FormatToggle` - Toggle globally
- `:FormatToggle!` - Toggle for current buffer

## Enabled Language Servers

- **Nix**: nil_ls
- **Python**: pylsp
- **JavaScript/TypeScript**: ts_ls (diagnostics only, formatting disabled)
- **HTML**: html (diagnostics only, formatting disabled)
- **CSS**: cssls
- **Bash**: bashls
- **JSON**: jsonls
- **YAML**: yamlls
- **Markdown**: marksman (diagnostics only, formatting disabled)
- **Docker**: dockerls
- **SQL**: sqls
- **Emmet**: emmet_ls

## Formatters

Formatters are managed by conform.nvim and run on save:

- **JavaScript/TypeScript**: deno_fmt
- **Markdown**: deno_fmt
- **HTML**: prettierd
- **Nix**: nixfmt-rfc-style
- **Bash**: shellcheck → shellharden → shfmt (chained)
- **C++**: clang_format

All formatters include automatic trailing whitespace trimming and blank line normalization.

## Modifying the Configuration

### Adding a New Plugin

1. Create a new `.nix` file in the appropriate plugin category directory
2. The file will be auto-imported via the category's `default.nix`

Example - adding a new editor plugin:
```nix
# config/plugins/editor/my-plugin.nix
{
  plugins.my-plugin = {
    enable = true;
    settings = {
      option = value;
    };
  };
}
```

### Adding a Language Server

Edit `config/plugins/lsp/lsp.nix`:

```nix
servers = {
  # Add your LSP
  rust_analyzer.enable = true;
};
```

If the LSP provides formatting, disable it to avoid conflicts with conform.nvim:
```nix
rust_analyzer = {
  enable = true;
  onAttach.function = ''
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  '';
};
```

### Adding a Formatter

Edit `config/plugins/lsp/conform.nix`:

```nix
formatters_by_ft = {
  rust = [ "rustfmt" ];
};

formatters = {
  rustfmt = {
    command = lib.getExe pkgs.rustfmt;
  };
};
```

### Adding Keybindings

Edit `config/settings/keymaps.nix` for global keybindings, or add them to the plugin's `.nix` file for plugin-specific bindings:

```nix
keymaps = [
  {
    mode = "n";
    key = "<leader>x";
    action = ":MyCommand<CR>";
    options.desc = "Description for which-key";
  }
];
```

For Lua actions, use `__raw`:
```nix
action.__raw = "function() require('plugin').method() end";
```

### Changing Options

Edit `config/settings/options.nix`:

```nix
opts = {
  number = true;           # Show line numbers
  relativenumber = true;   # Relative line numbers
  tabstop = 2;            # Tab width
  # etc.
};
```

## Development Shell

The flake provides a dev shell with language toolchains:

```bash
nix develop
```

Includes: Rust, Go, Elixir, F#, Gleam, Kotlin, and ripgrep.

## Updating

```bash
# Update all flake inputs
nix flake update

# Update specific input (e.g., nixvim)
nix flake update nixvim

# Format Nix files
nix fmt
```

## Troubleshooting

### Configuration not updating in nix-darwin

After pushing changes to GitHub, update the flake input in your nix-darwin config:

```bash
cd /path/to/nix-darwin-config
nix flake update nixvim --refresh
sudo darwin-rebuild switch --flake .#
```

### Formatting conflicts

If multiple formatters fight over a file:
1. Check that LSP formatting is disabled in `config/plugins/lsp/lsp.nix`
2. Ensure only one formatter is configured per filetype in `config/plugins/lsp/conform.nix`
3. Verify `lsp-format.enable` is set to `false`

### Build errors

```bash
# Check for errors
nix flake check

# View detailed error logs
nix log /nix/store/xxx-nixvim.drv
```

## Credits

Based on configurations from:
- [GaetanLepage/nix-config](https://github.com/GaetanLepage/nix-config)
- [neve](https://github.com/redyf/Neve)
- dc-tec's configuration
