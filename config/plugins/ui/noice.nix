{
  plugins.noice = {
    enable = true; # testing dressing
    settings = {
      lsp = {
        # Override markdown rendering so that hover and signature help use noice
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        # LSP hover and signature help with borders
        hover = {
          enabled = true;
          silent = false;
        };
        signature = {
          enabled = true;
          auto_open = {
            enabled = true;
            trigger = true;
            luasnip = true;
            throttle = 50;
          };
        };
        # Show progress messages from LSP servers
        progress = {
          enabled = true;
          format = "lsp_progress";
          format_done = "lsp_progress_done";
        };
      };
      # Classic Cmdline Instead of the default floating one from noice
      cmdline = {
        view = "cmdline";
      };
      # Preset for better borders
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = true; # This adds borders to LSP hover and signature help
      };
      # Routes for different message types
      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "written";
          };
          opts = {
            skip = true;
          };
        }
      ];
    };
  };
}
