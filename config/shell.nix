# straight lifted from https://github.com/MikaelFangel/nixvim-config
# TODO: find out what pkgs.mkShell does in a nixvim config
{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Tools
    ripgrep
    # Frontend
    typescript-language-server
    prettierd

    rustc # Rust
    cargo # cargo keybindings to common cargo commands, mapped to <leader>r* in keymaps.nix
    rust-analyzer # type checking, autocomplete, inline hints, go-to-definition, error diagnostics
    rustfmt # auto-formatting rust code on save
    clippy # rust linter for catching common mistakes

    # # Gleam
    # gleam

    # # Elixir
    # elixir

    # # FSharp
    # dotnet-sdk
    # fsautocomplete
    # fantomas

    # # Go
    # go

    # # Kotlin
    # kotlin-native
  ];
}
