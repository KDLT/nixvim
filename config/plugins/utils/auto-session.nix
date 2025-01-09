# nixvim reference: https://nix-community.github.io/nixvim/plugins/auto-session/index.html
# plugin homepage: https://github.com/rmagatti/auto-session
# automatically save sessions under ~/.local/share/nvim/sessions
{
  plugins = {
    # note that auto-session requires XDG_DATA_HOME to be assigned to a writeable directory
    auto-session = {
      enable = true;
      settings = {
        enabled = true;
        root_dir = "$XDG_DATA_HOME/nvim/sessions"; # ~/.local/share/nvim/sessions
        # root_dir = { __raw = "vim.fn.stdpath 'data' .. '/sessions/'"; };
        auto_create = true;
        auto_save = true;
        auto_restore = true;
        log_level = "error";

        session_lens = {
          load_on_setup = true;
          previewer = false; # this previews the session file which is essentially jibberish
        };

        session_control = {
          control_dir = "$XDG_DATA_HOME/nvim/auto_session/";
          control_filename = "session_control.json";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<Cmd>SessionSearch<CR>";
      options = {
        silent = true;
        desc = "Telescope Session Search";
      };
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<Cmd>SessionSave<CR>";
      options = {
        silent = true;
        desc = "Session Save";
      };
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<Cmd>SessionDelete<CR>";
      options = {
        silent = true;
        desc = "Session Delete";
      };
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = "<Cmd>SessionRestore<CR>";
      options = {
        silent = true;
        desc = "Session Restore";
      };

    }
  ];
}
