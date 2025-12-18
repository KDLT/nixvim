{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "Add file to Harpoon";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
      options.desc = "Toggle Harpoon quick menu";
    }
    {
      mode = "n";
      key = "<leader>1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Harpoon file 1";
    }
    {
      mode = "n";
      key = "<leader>2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Harpoon file 2";
    }
    {
      mode = "n";
      key = "<leader>3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Harpoon file 3";
    }
    {
      mode = "n";
      key = "<leader>4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Harpoon file 4";
    }
    {
      mode = "n";
      key = "<leader>5";
      action.__raw = "function() require('harpoon'):list():select(5) end";
      options.desc = "Harpoon file 5";
    }
    {
      mode = "n";
      key = "<leader>6";
      action.__raw = "function() require('harpoon'):list():select(6) end";
      options.desc = "Harpoon file 6";
    }
    {
      mode = "n";
      key = "<leader>7";
      action.__raw = "function() require('harpoon'):list():select(7) end";
      options.desc = "Harpoon file 7";
    }
    {
      mode = "n";
      key = "<leader>8";
      action.__raw = "function() require('harpoon'):list():select(8) end";
      options.desc = "Harpoon file 8";
    }
    {
      mode = "n";
      key = "<leader>9";
      action.__raw = "function() require('harpoon'):list():select(9) end";
      options.desc = "Harpoon file 9";
    }
  ];
}
