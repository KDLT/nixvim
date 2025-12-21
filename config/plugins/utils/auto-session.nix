# nixvim reference: https://nix-community.github.io/nixvim/plugins/auto-session/index.html
# plugin homepage: https://github.com/rmagatti/auto-session
# automatically save sessions under ~/.local/share/nvim/sessions
#
# COMMANDS (nixvim provides these wrapped commands, NOT the upstream :AutoSession commands):
#   :SessionSearch   - Telescope picker to search and load sessions
#   :SessionSave     - Manually save current session
#   :SessionRestore  - Restore session for current directory
#   :SessionDelete   - Delete a session
{
  plugins = {
    # note that auto-session requires XDG_DATA_HOME to be assigned to a writeable directory
    auto-session = {
      enable = true;
      settings = {
        enabled = true;
        root_dir = "$XDG_DATA_HOME/nvim/sessions"; # ~/.local/share/nvim/sessions

        # Automatic behaviors
        auto_create = true; # Create session files automatically
        auto_save = true; # Auto-save session on exit
        auto_restore = true; # Auto-restore session on startup

        # Suppress session creation in these directories (useful for home dir, tmp, etc.)
        suppressed_dirs = [
          "~/"
          "~/Downloads"
          "/tmp"
        ];

        # Log level (options: debug, info, warn, error)
        log_level = "error";

        # Close unsupported window types before saving (helps with plugin windows)
        close_unsupported_windows = true;

        # Skip saving when only these filetypes are open (works with startify)
        bypass_save_filetypes = [
          "startify"
          "alpha"
          "dashboard"
        ];

        # Telescope integration for session search
        session_lens = {
          load_on_setup = true;
          previewer = false; # Session files aren't human-readable
        };

        # Session metadata storage
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
      key = "<leader>Ss";
      action = "<Cmd>AutoSession search <CR>";
      options = {
        silent = true;
        desc = "Telescope Session Search";
      };
    }
    {
      mode = "n";
      key = "<leader>SS";
      action = "<Cmd>AutoSession save <CR>";
      options = {
        silent = true;
        desc = "Session Save";
      };
    }
    {
      mode = "n";
      key = "<leader>Sd";
      action = "<Cmd>AutoSession delete <CR>";
      options = {
        silent = true;
        desc = "Session Delete";
      };
    }
    {
      mode = "n";
      key = "<leader>Sr";
      action = "<Cmd>AutoSession restore <CR>";
      options = {
        silent = true;
        desc = "Session Restore";
      };

    }
  ];
}
