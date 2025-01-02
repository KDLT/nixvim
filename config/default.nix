# Reference: https://github.com/GaetanLepage/nix-config/tree/master/home/modules/tui/neovim
{
  # testing out scanPaths
  imports = [
    ./plugins
    ./settings
  ];
}
