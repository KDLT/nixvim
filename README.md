# KDLT's Nixvim Configuration

A declarative Neovim configuration using [nixvim](https://github.com/nix-community/nixvim), designed to be used as a flake input in nix-darwin or NixOS systems.

## Features

- **Modular structure** with auto-importing plugin groups
- **LSP support** for Nix, Python, TypeScript/JavaScript, HTML, CSS, Bash, and more
- **JSDoc type checking** for JavaScript with neogen auto-generation
- **Format-on-save** using deno_fmt (JS/TS/Markdown), prettierd (HTML), and language-specific formatters
- **Harpoon2** for quick file navigation with bufferline integration
- **Telescope** for fuzzy finding files, grep, diagnostics, and LSP symbols
- **Neo-tree** file explorer
- **mini.nvim** modules (icons, indentscope, surround)
- **Catppuccin** color scheme
- **Treesitter** for syntax highlighting and code understanding
- **Auto-completion** with nvim-cmp, luasnip, and LSP integration
- **Toggleterm** for floating terminal
- **which-key** for keybinding discovery

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
    ├── editor/          # Core editing (treesitter, neo-tree, undotree)
    ├── git/             # Git integration (gitsigns, lazygit)
    ├── lsp/             # LSP and formatting (conform.nvim)
    ├── themes/          # Color schemes (catppuccin)
    ├── ui/              # UI enhancements (lualine, bufferline, zen-mode, which-key)
    └── utils/           # Utilities (telescope, harpoon, neogen, toggleterm, mini)
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
- `<C-c>` - Toggle between two most recent buffers

### File Navigation
- `<leader>e` - Toggle Neo-tree file explorer
- `<C-p>` - Telescope git files
- `<C-f>` - Telescope find files
- `<C-g>` - Telescope live grep
- `<leader><space>` - Telescope find project files
- `<leader>/` - Ripgrep (root dir)
- `<leader>:` - Command history
- `<leader>o` - Recently opened files

### Harpoon (Quick File Navigation)
Harpoon numbers are displayed in bufferline for easy identification.

- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<leader>1` to `<leader>9` - Jump to Harpoon file 1-9

### LSP & Diagnostics
- `K` - Show hover documentation
- `gd` - Goto definition
- `<leader>d` - Show diagnostic in float
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `<leader>q` - Add diagnostics to location list
- `<leader>ld` - Stop LSP
- `<leader>le` - Start LSP

### JSDoc Generation
- `<leader>jd` - Generate JSDoc annotation
- `<leader>jf` - Generate JSDoc for function

Type `/**` above a function, press `<leader>jf`, and neogen will auto-generate parameter tags. Use `<Tab>` and `<Shift-Tab>` to jump between placeholders.

### Surround (mini.surround)
- `sa{motion}{char}` - Add surrounding (e.g., `saiw"` to surround word with quotes)
- `sd{char}` - Delete surrounding (e.g., `sd"` to remove quotes)
- `sr{old}{new}` - Replace surrounding (e.g., `sr"'` to change quotes)
- `sf{char}` - Find surrounding (right)
- `sF{char}` - Find surrounding (left)
- `sh{char}` - Highlight surrounding

### Git
- `<leader>gs` - Git status (Telescope)
- `<leader>gc` - Git commits (Telescope)

### Telescope
- `<leader>ff` - LSP document symbols (functions/variables in current file)
- `<leader>fg` - Live grep
- `<leader>fb` - Telescope builtins
- `<leader>fd` - Workspace diagnostics
- `<leader>fs` - Symbols picker (emoji, kaomoji, math symbols)
- `<leader>b` - List buffers
- `<leader>fc` - Change colorscheme
- `<leader>fh` - Help tags
- `<leader>fk` - View keymaps

### Buffer Management
- `<S-h>` - Cycle to previous buffer
- `<S-l>` - Cycle to next buffer
- `<leader>bo` - Close all other buffers
- `<leader>bd` - Close current buffer
- `<leader>bp` - Toggle pin
- `<leader>bP` - Delete non-pinned buffers

### Terminal
- `<leader>tt` - Toggle floating terminal
- `<C-h/j/k/l>` - Navigate to other windows from terminal (exit method)

### Other
- `<leader>u` - Toggle Undotree
- `<leader>z` - Toggle Zen-mode
- `<leader>p` - Toggle breakpoint (debugging)

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
- **JavaScript/TypeScript**: ts_ls (with JSDoc type checking enabled)
- **HTML**: html (diagnostics only, formatting disabled)
- **CSS**: cssls
- **Bash**: bashls
- **JSON**: jsonls
- **YAML**: yamlls
- **Markdown**: marksman (diagnostics only, formatting disabled)
- **Docker**: dockerls
- **SQL**: sqls
- **Emmet**: emmet_ls

## TypeScript/JavaScript Configuration

The ts_ls language server is configured for **JSDoc type safety**:
- Type checking enabled for JavaScript files
- Validates JSDoc annotations
- Provides autocomplete, goto definition, and hover
- Use `<leader>jf` to auto-generate JSDoc from function signatures

Example:
```javascript
/**
 * Creates a person object
 * @param {string} name - The person's name
 * @param {number} age - The person's age
 * @returns {{name: string, age: number}}
 */
function createPerson(name, age) {
  return { name, age };
}
```

## Formatters

Formatters are managed by conform.nvim and run on save:

- **JavaScript/TypeScript**: deno_fmt
- **Markdown**: deno_fmt
- **HTML**: prettierd
- **Nix**: nixfmt-rfc-style
- **Bash**: shellcheck → shellharden → shfmt (chained)
- **C++**: clang_format

## Modifying the Configuration

### Adding a New Plugin

1. Create a new `.nix` file in the appropriate plugin category directory
2. Add the import to the category's `default.nix`

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

Then add to `config/plugins/editor/default.nix`:
```nix
{
  imports = [
    ./my-plugin.nix
    # ... other imports
  ];
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

### Adding which-key Descriptions

Edit `config/plugins/utils/which-key.nix`:

```nix
{
  __unkeyed-1 = "<leader>x";
  desc = "My custom action";
  icon = " ";
}
```

For groups:
```nix
{
  __unkeyed-1 = "<leader>x";
  group = "My Group";
  icon = " ";
}
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

## Bufferline Integration

The bufferline shows harpoon numbers next to filenames:
```
1 script.js | index.html | 3 styles.css
```

Files with harpoon numbers can be quickly accessed with `<leader>1`, `<leader>3`, etc.

## Development Shell

The flake provides a dev shell with language toolchains (configured in `config/shell.nix`):

```bash
nix develop
```

Currently commented out: Rust, Go, Elixir, F#, Gleam, Kotlin. Uncomment as needed.

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

### Tab not jumping in snippets

If `<Tab>` doesn't jump between snippet placeholders:
- Check that you're in a luasnip snippet (generated by neogen with `<leader>jf`)
- Verify the snippet is active (you should see SELECT mode in statusline)
- The Tab/Shift-Tab mappings are configured in `config/plugins/cmp/completions.nix`

### Build errors

```bash
# Check for errors
nix flake check

# View detailed error logs
nix log /nix/store/xxx-nixvim.drv
```

### Import errors

When adding or removing plugin files, ensure the corresponding `default.nix` import list is updated. The auto-importing only works if the file is listed in the imports array.

## Credits

Based on configurations from:
- [GaetanLepage/nix-config](https://github.com/GaetanLepage/nix-config)
- [neve](https://github.com/redyf/Neve)
- dc-tec's configuration
