{
  opts.completeopt = [
    "menu"
    "menuone"
    "noselect"
  ];

  # Enable JSDoc snippets for JavaScript/TypeScript
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    -- Extend JavaScript to include JSDoc snippets from friendly-snippets
    ls.filetype_extend("javascript", { "jsdoc" })
    ls.filetype_extend("typescript", { "jsdoc" })

    -- Custom inline type annotation snippets (these don't conflict with LSP)
    ls.add_snippets("javascript", {
      -- Generic inline type: jtype -> /** @type {Type} */ (expression)
      s("jtype", fmt("/** @type {{{}}} */ ({})", {
        i(1, "Type"),
        i(2, "expression"),
      })),

      -- HTMLInputElement shortcut: jinput -> /** @type {HTMLInputElement} */ (getElementById)
      s("jinput", fmt("/** @type {{HTMLInputElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),

      -- HTMLElement shortcut: jelem -> /** @type {HTMLElement} */ (getElementById)
      s("jelem", fmt("/** @type {{HTMLElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),

      -- HTMLButtonElement: jbutton
      s("jbutton", fmt("/** @type {{HTMLButtonElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),

      -- HTMLFormElement: jform
      s("jform", fmt("/** @type {{HTMLFormElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),
    })

    -- Same snippets for TypeScript
    ls.add_snippets("typescript", {
      s("jtype", fmt("/** @type {{{}}} */ ({})", {
        i(1, "Type"),
        i(2, "expression"),
      })),
      s("jinput", fmt("/** @type {{HTMLInputElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),
      s("jelem", fmt("/** @type {{HTMLElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),
      s("jbutton", fmt("/** @type {{HTMLButtonElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),
      s("jform", fmt("/** @type {{HTMLFormElement}} */ ({})", {
        i(1, 'document.getElementById("id")'),
      })),
    })
  '';

  plugins = {
    luasnip.enable = true;
    friendly-snippets.enable = true;
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

        # Add borders and padding to completion window
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None";
            scrollbar = true;
          };
          documentation = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder";
          };
        };

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
