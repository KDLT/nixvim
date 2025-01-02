{
  # undotree.nix
  keymaps = [
    {
      mode = "n";
      key = "<leader><F5>";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        desc = "Toggle Undotree";
      };
    }
  ];

  plugins.undotree = {
    enable = true;
    # straight up copied from undotree docs, didn't bother reading
    settings = {
      CursorLine = true;
      DiffAutoOpen = true;
      DiffCommand = "diff";
      DiffpanelHeight = 10;
      HelpLine = true;
      HighlightChangedText = true;
      HighlightChangedWithSign = true;
      HighlightSyntaxAdd = "DiffAdd";
      HighlightSyntaxChange = "DiffChange";
      HighlightSyntaxDel = "DiffDelete";
      RelativeTimestamp = true;
      SetFocusWhenToggle = true;
      ShortIndicators = false;
      SplitWidth = 40;
      TreeNodeShape = "*";
      TreeReturnShape = "\\";
      TreeSplitShape = "/";
      TreeVertShape = "|";
      WindowLayout = 1; # only changed the window layout so it appears on the left
    };
  };
}
