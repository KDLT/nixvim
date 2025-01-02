{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        diagnostics = "nvim_lsp";
        mode = "buffers";

        close_icon = " ";
        buffer_close_icon = "󰱝 ";
        modified_icon = "󰔯 ";

        always_show_bufferline = false;

        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Cycle to Next Buffer";
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Cycle to Previous Buffer";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<CR>";
      options.desc = "Close every other except the visible one";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options.desc = "Close current visible buffer";
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options.desc = "Toggle pin";
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete non-pinned buffers";
    }

    # TODO: the rest the relevant bufferline keymaps
  ];
}
