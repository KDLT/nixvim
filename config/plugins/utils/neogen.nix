{
  plugins.neogen = {
    enable = true;

    settings = {
      # Use luasnip as the snippet engine (you already have this)
      snippet_engine = "luasnip";

      # Enable placeholders for jumping between fields
      enable_placeholders = true;

      # Configure JSDoc for JavaScript and TypeScript
      languages = {
        javascript = {
          template = {
            annotation_convention = "jsdoc";
          };
        };
        typescript = {
          template = {
            annotation_convention = "jsdoc";
          };
        };
      };
    };
  };

  # Keybinding to generate JSDoc
  keymaps = [
    {
      mode = "n";
      key = "<leader>jd";
      action.__raw = "function() require('neogen').generate() end";
      options.desc = "Generate JSDoc annotation";
    }
    {
      mode = "n";
      key = "<leader>jf";
      action.__raw = "function() require('neogen').generate({ type = 'func' }) end";
      options.desc = "Generate JSDoc for function";
    }
  ];
}
