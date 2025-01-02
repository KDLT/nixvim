{ pkgs, ... }:
{
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    helm.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nil_ls = {
          # nix language server
          enable = true;
          settings.nix = {
            # with nix-index-database installed, i used `nix-locate "bin/nix" | grep nix.out`
            # verified upon rebuild that this points to the correct path
            binary = "${pkgs.nix}/bin/nix"; # i wonder if this would be correct
            maxMemoryMB = null; # default is null and null means no limit
            flake = {
              autoArchive = true; # removes the warning about no autocompletion, uses network
              autoEvalInputs = true; # this one adds the suggestmentses
            };
          };
        };
        bashls.enable = true; # bash lsp
        dockerls.enable = true; # dockerfile lsp
        marksman.enable = true; # markdown lsp
        pyright.enable = true;
        gopls.enable = true; # google golang lsp
        terraformls.enable = true;
        ansiblels.enable = true;
        clangd.enable = true; # C
        texlab.enable = true; # LaTeX
        lua_ls.enable = true; # Lua
        pylsp.enable = true; # Python
        jsonls.enable = true; # JSON
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # Tailwind CSS
        html.enable = true; # HTML
        emmet_ls.enable = true; # Emmet
        sqls.enable = true; # SQL
        ts_ls.enable = true; # TypeScript
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                  "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" = "*flow*.{yml,yaml}";
                };
              };
            };
          };
        };
      };

      # servers = {
      #   nixd.enable = true; # NixD is BROKEN
      #   clangd.enable = true; # C
      #   texlab.enable = true; # LaTeX
      #   lua_ls.enable = true; # Lua
      #   pylsp.enable = true; # Python
      #   jsonls.enable = true; # JSON
      #   cssls.enable = true; # CSS
      #   tailwindcss.enable = true; # Tailwind CSS
      #   html.enable = true; # HTML
      #   emmet_ls.enable = true; # Emmet
      #   sqls.enable = true; # SQL
      #   ts_ls.enable = true; # TypeScript
      #   yamlls.enable = true; # YAML
      # };

      #   keymaps = {
      #     silent = true;
      #     diagnostic = {
      #       # navigate diagnostics
      #       "[d" = "goto_prev";
      #       "]d" = "goto_next";
      #     };
      #     lspBuf = {
      #       gd = "definition";
      #       gD = "references";
      #       gt = "type_definition";
      #       gi = "implementation";
      #       K = "hover";
      #       "<F2>" = "rename";
      #     };
      #   };

    };
  };
}
