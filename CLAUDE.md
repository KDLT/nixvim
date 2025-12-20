# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a declarative Neovim configuration using nixvim, a Nix-based framework for configuring Neovim. The configuration is designed to be used as a flake input in a nix-darwin or NixOS system configuration.

## Essential Commands

### Building and Testing
```bash
# Build the configuration
nix build .#default

# Run nixvim directly without installing
nix run .

# Check configuration validity (runs tests)
nix flake check

# Update all flake inputs
nix flake update

# Update specific input (e.g., nixvim itself)
nix flake update nixvim

# Format Nix files
nix fmt
```

### Development
The flake provides a dev shell with various language toolchains (Rust, Go, Elixir, etc.) defined in `config/shell.nix`. Access it with:
```bash
nix develop
```

## Architecture

### Module Structure
The configuration uses Nix's module system with auto-importing via `default.nix` files:

```
config/
├── default.nix          # Entry point, imports plugins/ and settings/
├── settings/
│   ├── default.nix      # Imports autocommands, keymaps, options
│   ├── autocommands.nix
│   ├── keymaps.nix
│   └── options.nix
└── plugins/
    ├── default.nix      # Imports all plugin categories
    ├── cmp/             # Completion plugins
    ├── editor/          # Core editor functionality (treesitter, neo-tree, etc.)
    ├── git/             # Git integration
    ├── lsp/             # Language servers and formatting
    ├── themes/          # Color schemes
    ├── ui/              # UI enhancements (bufferline, lualine, noice, etc.)
    └── utils/           # Utility plugins (telescope, harpoon, which-key, etc.)
```

Each subdirectory has a `default.nix` that imports its module files, creating a hierarchical auto-importing structure.

### Flake Integration
The flake (`flake.nix`) imports the configuration module and wraps it with nixvim's `makeNixvimWithModule`. This is designed to be referenced as a flake input in a parent nix-darwin or NixOS configuration, not used standalone.

## Important nixvim Patterns

### Modern Option Syntax
Nixvim is migrating plugin options to a `settings` namespace. Always use:
```nix
plugins.example = {
  enable = true;
  settings = {
    option_name = value;  # Use snake_case, not camelCase
  };
};
```

### Keymaps
Keymaps should be defined at the top level, not within plugin configs (especially after harpoon2 migration):
```nix
keymaps = [
  {
    mode = "n";
    key = "<leader>x";
    action = "command";
    options.desc = "Description for which-key";
  }
];
```

For Lua functions in actions, use `__raw`:
```nix
action.__raw = "function() require('plugin').method() end";
```

### LSP Configuration
LSP servers are enabled declaratively in `config/plugins/lsp/lsp.nix`:
```nix
plugins.lsp = {
  enable = true;
  inlayHints = true;
  servers = {
    nil_ls.enable = true;  # Nix LSP
    pylsp.enable = true;   # Python LSP
    # etc.
  };
};
```

Formatting is handled separately by conform.nvim in `config/plugins/lsp/conform.nix`.

### LSP Floating Window Borders
LSP floating windows (hover, signature help, diagnostics) are styled by noice.nvim in `config/plugins/ui/noice.nix`. This provides proper bordered windows for LSP documentation with the `lsp_doc_border` preset enabled.

## Common Issues

### After Updating nixvim Input
When this configuration is updated via git push and referenced by a nix-darwin config, the parent system needs to explicitly update its flake input:
```bash
cd /path/to/nix-darwin-config
nix flake update nixvim  # or whatever the input is named
sudo darwin-rebuild switch --flake .#
```

### Deprecation Warnings
If you see warnings about deprecated options, check the nixvim documentation for the current syntax. Most commonly:
- Move options into `settings = { }`
- Convert camelCase to snake_case
- Use `__raw` for Lua code instead of `lua` attribute

### Build Artifacts
The `result` symlink is created by `nix build` and should be gitignored. It points to the built package in `/nix/store/`.
