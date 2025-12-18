{ pkgs, ... }:
{
  # Add telescope-symbols as an extra plugin
  extraPlugins = [ pkgs.vimPlugins.telescope-symbols-nvim ];

  # doesn't work
  # extraConfigLua = ''
  #   require("telescope").load_extension("telescope-symbols-nvim")
  # '';

  plugins.telescope = {
    enable = true;

    keymaps = {
      # find files using telescope command line "sugar"
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep Project Root";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Git Status";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Git Commits";
      };
      "<leader>ff" = {
        # action = "find_files";
        action = "lsp_document_symbols";
        options.desc = "Show Functions, Variables";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Telescope Grep from ./";
      };
      "<leader>fb" = {
        action = "builtin";
        options.desc = "Telescope Builtins";
      };
      "<leader>b" = {
        action = "buffers";
        options.desc = "Telescope Buffers";
      };
      "<leader>fc" = {
        action = "colorscheme";
        options.desc = "Telescope Coloscheme";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Telescope Help Tags";
      };
      "<leader>fd" = {
        action = "diagnostics";
        options.desc = "View Workspace Diagnostics";
      };
      "<leader>fk" = {
        action = "keymaps";
        options.desc = "View keymaps";
      };
      "<leader>fs" = {
        action = "symbols";
        options.desc = "Telescope Symbols";
      };
      "<leader>o" = {
        action = "oldfiles";
        options.desc = "Telescope Previously Opened Files";
      };
      "<leader>fo" = {
        action = "vim_options";
        options.desc = "Telescope vim-options";
      };

      # my Ctrl based bindings
      "<C-p>" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
      "<C-f>" = {
        action = "find_files";
        options.desc = "Telescope Files from ./";
      };
      "<C-g>" = {
        action = "live_grep";
        options.desc = "Live Grep from ./";
      };
    };

    settings.defaults = {
      file_ignore_patterns = [
        # Telescope builtins won't appear if nix store is ignored
        # "^/nix/store/" # i don't want old files populated by nix/store
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "^.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
