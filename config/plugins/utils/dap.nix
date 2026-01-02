{ pkgs, lib, ... }:
{
  plugins = {
    dap = {
      enable = true;
    };
    # DAP UI - provides the debugging interface
    dap-ui = {
      enable = true;
    };
  };
}
