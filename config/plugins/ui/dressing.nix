{
  # dressing.nvim - Improve the default vim.ui interfaces
  # Provides better UI for code actions, LSP rename, and other prompts
  # Works alongside noice.nvim to handle vim.ui.select and vim.ui.input
  plugins.dressing = {
    enable = true;
    settings = {
      # Better input prompts (LSP rename, etc.)
      input = {
        enabled = true;
        default_prompt = "Input:";
        title_pos = "left";
        border = "rounded";
        relative = "cursor";
        prefer_width = 40;
        max_width = [ 140 0.9 ];
        min_width = [ 20 0.2 ];
        # Vim keybindings work by default in input
        mappings = {
          n = {
            "<Esc>" = "Close";
            "<CR>" = "Confirm";
          };
          i = {
            "<C-c>" = "Close";
            "<CR>" = "Confirm";
            "<Up>" = "HistoryPrev";
            "<Down>" = "HistoryNext";
          };
        };
      };

      # Better select menus (code actions, etc.)
      select = {
        enabled = true;
        # Try telescope first, fallback to builtin
        backend = [ "telescope" "builtin" "nui" ];

        # Telescope backend config (best option - searchable, vim bindings)
        telescope = {
          # Inherits your telescope theme
          # j/k to navigate, / to search, <CR> to select
        };

        # Builtin fallback if telescope not available
        builtin = {
          border = "rounded";
          relative = "editor";
          position = "50%";
          max_width = 100;
          max_height = 20;
          min_width = 40;
          min_height = 10;
          # Vim keybindings enabled
          mappings = {
            "<Esc>" = "Close";
            "<C-c>" = "Close";
            "<CR>" = "Confirm";
          };
        };

        # Format function for code actions
        format_item_override = {
          # Show code action kind (quickfix, refactor, etc.)
        };
      };
    };
  };
}
