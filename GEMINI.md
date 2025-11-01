# Project Overview

This repository contains a Neovim configuration tailored for interactive frontend development, managed by Nix through `nixvim`. The setup is designed to provide a modern editing experience with features like LSP, auto-formatting, and syntax highlighting.

## Building and Running

To apply the Nixvim configuration and launch Neovim, run the following command from the project root:

```bash
nix run .
```

This will build the environment with all the specified plugins and settings and open Neovim.

## Development Conventions

This `nixvim` setup is built with frontend development in mind and includes the following tools and configurations:

*   **LSP:** `tsserver` is enabled for JavaScript and TypeScript, offering features like autocompletion, code navigation, and real-time error checking.
*   **Auto-formatting:** `prettierd` is configured to automatically format JavaScript and TypeScript files on save, ensuring consistent code style.
*   **Syntax Highlighting:** `treesitter` is set up with parsers for JavaScript and TypeScript, providing accurate and detailed highlighting.

The development environment, defined in `config/shell.nix`, includes the following key packages:

*   `typescript-language-server`
*   `prettierd`
*   `cargo` and `rustc`
*   `gleam`
*   `elixir`
*   `dotnet-sdk`, `fsautocomplete`, and `fantomas`
*   `go`
*   `kotlin-native`
*   `ripgrep`

Any additional tools or packages required for development should be added to the `buildInputs` in this file.
