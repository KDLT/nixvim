{
  plugins = {
    # highlights whitespaces and trim them upon save
    trim = {
      enable = true;
      settings = {
        highlight = true;
        highlight_bg = "#303030";
        # highlight_ctermbg = "gray";
        ft_blocklist = [
          "checkhealth"
          # "floaterm"
          # "lspinfo"
          # "neo-tree"
          "TelescopePrompt"
        ];
      };
    };
  };
}
