{
  plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;

      modules = {
        # :h MiniIcons.config for more info
        icons = {
          style = "glyph";
        };

        # animated indentation vertical bar
        indentscope = {
          symbol = "│";

          draw = {
            delay = 65; # 100
          };

          mappings = {
            goto_top = "[i";
            goto_bottom = "]i";
          };

          options = {
            try_as_border = true;
          };
        };
        surround = { };
      };
    };
  };
}
