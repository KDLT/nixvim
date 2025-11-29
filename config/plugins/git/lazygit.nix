{ pkgs, ... }:
{
  plugins.lazygit = {
    enable = true;
  };

  # testing if it still workss#
  # reference: https://github.com/kdheepak/lazygit.nvim?tab=readme-ov-file#telescope-plugin
  extraPlugins = [ pkgs.vimPlugins.lazygit-nvim ];

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];
}
