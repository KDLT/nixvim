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

    # # Rust
    # cargo
    # rustc

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
