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
  ];

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
            # binary = "${pkgs.nix}/bin/nix"; # i wonder if this would be correct
            maxMemoryMB = null; # default is null and null means no limit
            flake = {
              autoArchive = true; # removes the warning about no autocompletion, uses network
              autoEvalInputs = true; # this one adds the suggestmentses
            };
          };
        };
        html.enable = true; # HTML https://github.com/hrsh7th/vscode-langservers-extracted
        emmet_ls.enable = true; # Emmet https://github.com/aca/emmet-ls
        cssls.enable = true; # CSS https://github.com/hrsh7th/vscode-langservers-extracted
        bashls.enable = true; # bash https://github.com/bash-lsp/bash-language-server
        dockerls.enable = true; # dockerfile https://github.com/rcjsuen/dockerfile-language-server-nodejs
        marksman.enable = true; # markdown https://github.com/artempyanykh/marksman
        # pyright.enable = true; # python type checker https://github.com/Microsoft/pyright
        # gopls.enable = true; # google golang https://github.com/golang/tools/tree/master/gopls
        # terraformls.enable = true; # https://github.com/hashicorp/terraform-ls
        # ansiblels.enable = true; https://github.com/ansible/ansible-language-server
        # clangd.enable = true; # C++ https://clangd.llvm.org/installation.html
        # texlab.enable = true; # LaTeX https://github.com/latex-lsp/texlab
        # lua_ls.enable = true; # Lua https://github.com/luals/lua-language-server
        pylsp.enable = true; # Python https://github.com/python-lsp/python-lsp-server
        jsonls.enable = true; # JSON https://github.com/hrsh7th/vscode-langservers-extracted
        sqls.enable = true; # SQL https://github.com/sqls-server/sqls
        # ts_ls.enable = true; # TypeScript https://github.com/typescript-language-server/typescript-language-server
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
