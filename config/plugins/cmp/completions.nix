{
  opts.completeopt = [
    "menu"
    "menuone"
    "noselect"
  ];

  plugins = {
    luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = true;
    cmp-emoji.enable = true;

    lspkind = {
      enable = true;
      settings = {
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
          };
        };
      };
    };

    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          # Tab: Jump to next snippet field if in snippet, otherwise select next completion
          "<Tab>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if luasnip.locally_jumpable(1) then
                  luasnip.jump(1)
                elseif cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, { 'i', 's' })
            '';
          };
          # Shift-Tab: Jump to previous snippet field if in snippet, otherwise select previous completion
          "<S-Tab>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                elseif cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { 'i', 's' })
            '';
          };

          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Enter>" = "cmp.mapping.complete()";
          "<C-Return>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";

          # this fucking sucks when it autocompletes the last word on a line so i set it to false
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        autoEnableSources = true;

        sources = [
          { name = "git"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            # words from other open buffers can be suggested
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "neorg"; }
        ];
      };
    };
  };
}
