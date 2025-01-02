# schemeName = "tokyonight";
# schemeName = "catppuccin";
# schemeName = "dracula-nvim";
# schemeName = "kanagawa";
# schemeName = "palette";
# schemeName = "onedark";
{
  colorschemes = {
    # even if this is enabled, stylix takes over
    catppuccin = {
      enable = true;
      settings = {
        background = {
          dark = "mocha";
        };
        # transparent = true; # uncomment for tokyonight, kanagawa, onedark
        transparent_background = true; # uncomment for catppuccin, pallette
        # transparent_bg = true; # uncomment for draculanvim
        custom_highlights = ''
          function(highlights)
            return {
            cursorLineNr = { fg = highlights.peach, style = {} },
            NavicText = { fg = highlights.text },
            }
          end
        '';
      };
    };
  };
}
