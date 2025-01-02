# git reference: https://github.com/catgoose/nvim-colorizer.lua/
# nixvim reference: https://nix-community.github.io/nixvim/plugins/colorizer/index.html
{
  plugins.colorizer = {
    enable = true;
    settings = {
      user_default_options = {
        names = false;
      };
    };
  };
}
