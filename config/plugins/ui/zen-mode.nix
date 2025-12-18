{
  plugins.zen-mode = {
    enable = true;
    settings = {
      # lifted from https://nix-community.github.io/nixvim/plugins/zen-mode/settings/index.html
      plugins = {
        bufferline.enabled = true; # doesn't work for some reason
        gitsigns.enabled = true;
        tmux.enabled = false;
        options = {
          enabled = true;
          ruler = false;
          showcmd = false;
        };
        twilight.enabled = true;
      };
      # window = {
      #   backdrop = 0.95;
      #   height = 1;
      #   options = {
      #     signcolumn = "no";
      #   };
      #   width = 0.8;
      # };
    };

    # twilight.enable = true; ## why is this here? zen mode has no twilight
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>z";
      action = "<Cmd>ZenMode<CR>";
      options = {
        silent = true;
        desc = "Zen-mode toggle";
      };
    }
  ];

}
