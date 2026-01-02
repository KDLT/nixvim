{ pkgs, ... }:
{
  keymaps = [
    {
      key = "<leader>ld";
      mode = [ "n" ];
      action = ":LspStop<CR>";
      options.desc = "LSP Disable";
    }
    {
      key = "<leader>le";
      mode = [ "n" ];
      action = ":LspStart<CR>";
      options.desc = "LSP Enable";
    }
    # Diagnostic navigation and display
    {
      key = "]d";
      mode = [ "n" ];
      action.__raw = "vim.diagnostic.goto_next";
      options.desc = "Next diagnostic";
    }
    {
      key = "[d";
      mode = [ "n" ];
      action.__raw = "vim.diagnostic.goto_prev";
      options.desc = "Previous diagnostic";
    }
    {
      key = "<leader>d";
      mode = [ "n" ];
      action.__raw = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic in float";
    }
    {
      key = "<leader>q";
      mode = [ "n" ];
      action.__raw = "vim.diagnostic.setloclist";
      options.desc = "Add diagnostics to location list";
    }
    # LSP Code Actions - moved from native gr* mappings to <leader>c*
    {
      key = "<leader>ca";
      mode = [ "n" "v" ];
      action.__raw = "vim.lsp.buf.code_action";
      options.desc = "Code Actions";
    }
    {
      key = "<leader>cr";
      mode = [ "n" ];
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Rename Symbol";
    }
    {
      key = "<leader>cR";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_references<CR>";
      options.desc = "Find References";
    }
    {
      key = "<leader>ci";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_implementations<CR>";
      options.desc = "Go to Implementation";
    }
    {
      key = "<leader>ct";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_type_definitions<CR>";
      options.desc = "Go to Type Definition";
    }
    {
      key = "<leader>cd";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_definitions<CR>";
      options.desc = "Go to Definition";
    }
    {
      key = "<leader>cD";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_declarations<CR>";
      options.desc = "Go to Declaration";
    }
    {
      key = "<leader>ch";
      mode = [ "n" ];
      action.__raw = "vim.lsp.buf.signature_help";
      options.desc = "Signature Help";
    }
    {
      key = "<leader>cs";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      options.desc = "Document Symbols";
    }
    {
      key = "<leader>cS";
      mode = [ "n" ];
      action = "<cmd>Telescope lsp_workspace_symbols<CR>";
      options.desc = "Workspace Symbols";
    }
  ];

  plugins = {
    # this is inline diagnostics, turned off for reduced clutter
    # lsp-lines.enable = true;

    # lsp-format.enable = true; # DISABLED: conflicts with conform.nvim
    helm.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        # nixd.enable = true; # test if nixd is more stable
        nil_ls.enable = true;
        # nil_ls = {
        #   # nix language server
        #   enable = true;
        #   settings.nix = {
        #     # with nix-index-database installed, i used `nix-locate "bin/nix" | grep nix.out`
        #     # verified upon rebuild that this points to the correct path
        #     # binary = "${pkgs.nix}/bin/nix"; # i wonder if this would be correct
        #     maxMemoryMB = null; # default is null and null means no limit
        #     flake = {
        #       autoArchive = true; # removes the warning about no autocompletion, uses network
        #       autoEvalInputs = true; # this one adds the suggestmentses
        #     };
        #   };
        # };
        html = {
          enable = true; # HTML https://github.com/hrsh7th/vscode-langservers-extracted
          onAttach.function = ''
            -- Disable formatting, handled by conform.nvim
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        emmet_ls.enable = true; # Emmet https://github.com/aca/emmet-ls
        cssls.enable = true; # CSS https://github.com/hrsh7th/vscode-langservers-extracted
        bashls.enable = true; # bash https://github.com/bash-lsp/bash-language-server
        dockerls.enable = true; # dockerfile https://github.com/rcjsuen/dockerfile-language-server-nodejs
        marksman = {
          enable = true; # markdown https://github.com/artempyanykh/marksman
          onAttach.function = ''
            -- Disable formatting, handled by conform.nvim
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        # pyright.enable = true; # python type checker https://github.com/Microsoft/pyright
        # gopls.enable = true; # google golang https://github.com/golang/tools/tree/master/gopls
        # terraformls.enable = true; # https://github.com/hashicorp/terraform-ls
        # ansiblels.enable = true; https://github.com/ansible/ansible-language-server
        # clangd.enable = true; # C++ https://clangd.llvm.org/installation.html
        # texlab.enable = true; # LaTeX https://github.com/latex-lsp/texlab
        # lua_ls.enable = true; # Lua https://github.com/luals/lua-language-server
        pylsp.enable = true; # Python https://github.com/python-lsp/python-lsp-server
        # rust_analyzer moved to rustaceanvim.nix for better Rust integration
        taplo.enable = true; # TOML LSP for cargo.toml https://taplo.tamasfe.dev/
        jsonls.enable = true; # JSON https://github.com/hrsh7th/vscode-langservers-extracted
        sqls.enable = true; # SQL https://github.com/sqls-server/sqls
        ts_ls = {
          enable = true; # TypeScript https://github.com/typescript-language-server/typescript-language-server

          extraOptions = {
            settings = {
              javascript = {
                validate = {
                  enable = true;
                }; # Enable validation for JSDoc
                suggest = {
                  completeFunctionCalls = true; # Enable function signature completion
                };
                inlayHints = {
                  includeInlayParameterNameHints = "all";
                  includeInlayFunctionParameterTypeHints = true;
                };
              };
              typescript = {
                validate = {
                  enable = true;
                }; # Enable validation
                suggest = {
                  completeFunctionCalls = true; # Enable function signature completion
                };
                inlayHints = {
                  includeInlayParameterNameHints = "all";
                  includeInlayFunctionParameterTypeHints = true;
                };
              };
              implicitProjectConfiguration = {
                checkJs = true; # Enable type checking for JavaScript files with JSDoc
              };
            };
          };

          onAttach.function = ''
            -- Disable formatting, handled by conform.nvim
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        yamlls.enable = true; # https://github.com/redhat-developer/yaml-language-server

        # helm_ls = { # helm kubernetes management https://github.com/mrjosh/helm-ls
        #   enable = true;
        #   extraOptions = {
        #     settings = {
        #       "helm_ls" = {
        #         yamlls = {
        #           path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        #         };
        #       };
        #     };
        #   };
        # };
        # yamlls = {
        #   enable = true;
        #   extraOptions = {
        #     settings = {
        #       yaml = {
        #         schemas = {
        #           kubernetes = "'*.yaml";
        #           "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
        #           "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
        #           "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
        #           "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
        #           "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
        #           "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
        #           "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
        #           "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
        #           "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" = "*flow*.{yml,yaml}";
        #         };
        #       };
        #     };
        #   };
        # };
      };
    };
  };
}
