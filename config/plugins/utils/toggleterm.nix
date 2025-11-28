{
  plugins.toggleterm = {
    enable = true;
    settings = {
      # Terminal appears from bottom
      direction = "float"; # Options: "horizontal", "vertical", "float", "tab"

      # Floating window settings
      float_opts = {
        border = "curved"; # Options: "single", "double", "shadow", "curved"
        width = 120;
        height = 30;
      };

      # Size when using horizontal/vertical
      size = 20;

      # Open terminal in insert mode
      start_in_insert = true;

      # Close terminal with ESC in terminal mode
      # Set to false if you want to use ESC for other things
      terminal_mappings = true;

      # Hide terminal numbers in tabline/statusline
      hide_numbers = true;

      # Shade background of terminal
      shade_terminals = true;
      shading_factor = 2;

      # Persist size for split terminals
      persist_size = true;

      # Persist terminal mode (insert/normal) on re-open
      persist_mode = true;

      # Auto-scroll to bottom on terminal output
      auto_scroll = true;
    };
  };

  # Keybindings
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<CR>";
      options.desc = "Toggle floating terminal";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<CR>";
      options.desc = "Toggle horizontal terminal";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<CR>";
      options.desc = "Toggle vertical terminal";
    }
  ];

  # Lua config for terminal-specific keybindings
  extraConfigLua = ''
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      -- Navigate windows from terminal
      -- any of these can be used to exit the floating terminal
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      -- Close terminal with leader+tt from within terminal
      vim.keymap.set('t', '<leader>tt', [[<Cmd>ToggleTerm<CR>]], opts)
    end

    -- Apply keymaps to terminal buffers
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
  '';
}
