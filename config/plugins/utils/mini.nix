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
            goto_top = "[[";
            goto_bottom = "]]";
          };

          options = {
            try_as_border = true;
          };
        };
        surround = {
          # Mappings for surround actions
          mappings = {
            add = "sa"; # Add surrounding in Normal and Visual modes
            delete = "sd"; # Delete surrounding
            find = "sf"; # Find surrounding (to the right)
            find_left = "sF"; # Find surrounding (to the left)
            highlight = "sh"; # Highlight surrounding
            replace = "sr"; # Replace surrounding
            update_n_lines = "sn"; # Update `n_lines`

            # Disabled by default (set to empty string)
            suffix_last = "l"; # Suffix to search with "prev" method
            suffix_next = "n"; # Suffix to search with "next" method
          };

          # Number of lines within which surrounding is searched
          n_lines = 20;

          # Duration (in ms) of highlight when calling `MiniSurround.highlight()`
          highlight_duration = 500;
        };
      };
    };
  };
}
