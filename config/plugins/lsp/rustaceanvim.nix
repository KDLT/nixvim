{ pkgs, lib, ... }:
{
  plugins.rustaceanvim = {
    enable = true;

    # Install rust-analyzer through rustaceanvim
    # This replaces the rust_analyzer server in lsp.nix
    # rustAnalyzerPackage = pkgs.rust-analyzer;

    settings = {
      # Server configuration (rust-analyzer)
      server = {
        default_settings = {
          # Preserve previous rust-analyzer settings
          rust-analyzer = {
            check = {
              command = "clippy"; # Use clippy for linting
            };
            cargo = {
              allFeatures = true;
              loadOutDirsFromCheck = true;
            };
            procMacro = {
              enable = true;
            };
            inlayHints = {
              bindingModeHints = {
                enable = true;
              };
              closureReturnTypeHints = {
                enable = "always";
              };
              lifetimeElisionHints = {
                enable = "always";
              };
              typeHints = {
                enable = true;
              };
            };
          };
        };
      };

      # Tools configuration
      tools = {
        # Use toggleterm for runnables/testables (floating terminal)
        executor = "toggleterm";
        test_executor = "toggleterm";

        # Floating window config for explainError, expandMacro, etc.
        float_win_config = {
          border = "rounded";
          # Don't open splits for expandMacro - keep it in a floating window
          open_split = "horizontal";
        };

        # Hover actions (K on rust symbols)
        hover_actions = {
          replace_builtin_hover = true;
        };
      };

      # DAP (debugger) configuration
      dap = {
        # Auto-load debug configurations from rust-analyzer
        autoload_configurations = true;

        # Configure codelldb as a server adapter (required format for codelldb)
        adapter = {
          type = "server";
          port = ''''${port}'';
          host = "127.0.0.1";
          executable = {
            command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
            args = [
              "--port"
              ''''${port}''
            ];
          };
        };
      };
    };
  };

  # Rustaceanvim keybindings
  # Only valid RustLsp commands - follows rustaceanvim's philosophy
  keymaps = [
    # Core workflow commands
    {
      mode = "n";
      key = "<leader>rr";
      action.__raw = "function() vim.cmd.RustLsp('runnables') end";
      options.desc = "Run target (picker)";
    }
    {
      mode = "n";
      key = "<leader>rt";
      action.__raw = "function() vim.cmd.RustLsp('testables') end";
      options.desc = "Run tests (picker)";
    }
    {
      mode = "n";
      key = "<leader>rd";
      action.__raw = "function() vim.cmd.RustLsp('openDocs') end";
      options.desc = "Open docs.rs";
    }

    # Rust-specific features
    {
      mode = "n";
      key = "<leader>re";
      action.__raw = "function() vim.cmd.RustLsp { 'explainError', 'current' } end";
      options.desc = "Explain error (current line)";
    }
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "function() vim.cmd.RustLsp { 'explainError', 'cycle' } end";
      options.desc = "Explain next error (cycle)";
    }
    {
      mode = "n";
      key = "<leader>rN";
      action.__raw = "function() vim.cmd.RustLsp { 'explainError', 'cycle_prev' } end";
      options.desc = "Explain previous error (cycle)";
    }
    {
      mode = "n";
      key = "<leader>rm";
      action.__raw = "function() vim.cmd.RustLsp('expandMacro') end";
      options.desc = "Expand macro";
    }
    {
      mode = "n";
      key = "<leader>rh";
      action.__raw = "function() vim.cmd.RustLsp { 'hover', 'actions' } end";
      options.desc = "Hover actions";
    }

    # Debugger (requires codelldb)
    {
      mode = "n";
      key = "<leader>rD";
      action.__raw = "function() vim.cmd.RustLsp('debuggables') end";
      options.desc = "Debug (picker)";
    }
  ];
}
