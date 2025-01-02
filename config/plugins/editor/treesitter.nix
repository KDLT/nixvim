{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      folding = false;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # set to false if update time of ~100
        clearOnCursorMove = false;
      };
    };

    treesitter-context = {
      enable = true;
      settings = {
        line_numbers = true;
        max_lines = 0;
        min_window_height = 0;
        mode = "topline";
        multiline_threshold = 20;
        separator = "-";
        # separator = "nil";
        trim_scope = "inner";
        zindex = 20;
      };
    };
  };
}
