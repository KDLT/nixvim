{
  plugins = {
    # https://github.com/lukas-reineke/virt-column.nvim
    virt-column = {
      enable = true;
      settings = {
        char = "┃";
        enabled = true;
        exclude = {
          buftypes = [
            "nofile"
            "quickfix"
            "terminal"
            "prompt"
          ];
          filetypes = [
            "lspinfo"
            "packer"
            "checkhealth"
            "help"
            "man"
            "TelescopePrompt"
            "TelescopeResults"
          ];
        };
        highlight = "NonText";
        virtcolumn = "";

      };
    };

    # https://github.com/m4xshen/smartcolumn.nvim/
    smartcolumn = {
      enable = true; # auto-hide column
      settings = {
        colorcolumn = "100";
        custom_colorcolumn = {
          go = [
            "100"
            "130"
          ];
          java = [
            "100"
            "140"
          ];
          nix = [
            "100"
            "120"
          ];
          rust = [
            "80"
            "100"
          ];
        };

        disabled_filetypes = [
          "checkhealth"
          "help"
          "lspinfo"
          "markdown"
          "neo-tree"
          "noice"
          "text"
        ];

        scope = "window";
      };
    };
  };
}
