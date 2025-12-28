{
  plugins.crates-nvim = {
    enable = true;
    settings = {
      completion = {
        cmp.enabled = true; # integrate with nvim-cmp
      };
      lsp = {
        enabled = true;
        actions = true;
        completion = true;
        hover = true;
      };
    };
  };
}
