{
  keymaps = [
    {
      key = "<leader>t";
      action = "<cmd>Oil<CR>";
      options.desc = "Open Oil Buffer";
    }
  ];

  plugins.oil = {
    enable = true;
    settings = {
      preview = {
        # width = 0.8;
        min_width = 0.8;
      };
    };
  };
}
