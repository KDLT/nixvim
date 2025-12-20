{
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 200;
      expand = 1;
      notify = true;
      preset = false;
      replace = {
        desc = [
          [
            "<space>"
            "SPACE"
          ]
          [
            "<leader>"
            "SPACE"
          ]
          [
            "<[cC][rR]>"
            "RETURN"
          ]
          [
            "<[tT][aA][bB]>"
            "TAB"
          ]
          [
            "<[bB][sS]>"
            "BACKSPACE"
          ]
        ];
      };
      spec = [
        {
          # i don't know why they're called __unkeyed
          __unkeyed-1 = "<leader>a";
          # dunno why group is the description in which-key
          group = "Add Buffer to Harpoon";
          mode = "n";
        }
        {
          # i don't know why they're called __unkeyed
          __unkeyed-1 = "K";
          # dunno why group is the description in which-key
          group = "Declared in LSPBuf as Hover";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "󰓩 ";
        }
        {
          __unkeyed = "<leader>c";
          group = "Codesnap";
          icon = "󰄄 ";
          mode = "v";
        }
        {
          __unkeyed-1 = "<leader>bs";
          group = "Sort";
          icon = "󰒺 ";
        }
        {
          __unkeyed-1 = [
            {
              __unkeyed-1 = "<leader>f";
              # group = "Normal Visual Group";
              group = "Telescope";
            }
            {
              __unkeyed-1 = "<leader>f<tab>";
              group = "Normal Visual Group in Group";
            }
          ];
          mode = [
            "n"
            "v"
          ];
        }
        {
          __unkeyed-1 = "<leader>/";
          desc = "Ripgrep Project Root";
          mode = "n";
          icon = "󱐋";
        }
        {
          __unkeyed-1 = "<leader>:";
          desc = "Command History";
          mode = "n";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>e";
          __unkeyed-2 = "<cmd>Neotree toggle<cr>";
          desc = "Toggle Neotree";
          mode = "n";
          icon = "󰙅";
        }
        {
          __unkeyed-1 = "<leader>z";
          __unkeyed-2 = "<cmd>ZenMode<CR>";
          desc = "Zen-Mode toggle";
          mode = "n";
          silent = true;
          icon = "󰚀";
        }
        {
          __unkeyed-1 = "<leader>u";
          __unkeyed-2 = "<cmd>UndotreeToggle<CR>";
          desc = "Undotree toggle";
          mode = "n";
          silent = true;
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "windows";
          proxy = "<C-w>";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Toggleterm";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "Lsp";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
          icon = "󰊢";
        }
        {
          __unkeyed-1 = "<leader>j";
          group = "JSDoc";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>cS";
          __unkeyed-2 = "<cmd>CodeSnapSave<CR>";
          desc = "Save";
          mode = "v";
        }
        {
          __unkeyed-1 = "<leader>p";
          __unkeyed-2 = {
            __raw = ''
              function()
                require("dap").toggle_breakpoint()
              end
            '';
          };
          desc = "Breakpoint toggle";
          mode = "n";
          silent = true;
        }
        # Hide harpoon keybindings 1-9 from which-key
        {
          __unkeyed-1 = "<leader>1";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>2";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>3";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>4";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>5";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>6";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>7";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>8";
          hidden = true;
        }
        {
          __unkeyed-1 = "<leader>9";
          hidden = true;
        }
      ];
      win = {
        border = "single";
      };
    };
  };
}
