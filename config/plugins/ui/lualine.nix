# Repo: https://github.com/nvim-lualine/lualine.nvim
# Nixvim Plugin: https://nix-community.github.io/nixvim/plugins/lualine/index.html
{
  plugins.lualine = {
    enable = true;
    settings = {
      options.globalstatus = true;
      # +-------------------------------------------------+
      # | A | B | C                             X | Y | Z |
      # +-------------------------------------------------+
      sections = {
        lualine_a = [ "mode" ];

        lualine_b = [
          "branch"
          {
            __unkeyed.__raw = ''
              function()
                local recording_register = vim.fn.reg_recording()
                if recording_register == "" then
                    return ""
                else
                    return "Recording @" .. recording_register
                end
              end
            '';
          }
        ];

        lualine_c = [
          "filename"
          "diff"
        ];

        lualine_x = [
          "diagnostics"

          # Show active language server
          {
            __unkeyed.__raw = ''
              function()
                  local msg = ""
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_clients()
                  if next(clients) == nil then
                      return msg
                  end
                  for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return client.name
                      end
                  end
                  return msg
              end
            '';
            icon = " ";
            color.fg = "#ffffff";
          }

          # Show active formatter(s)
          {
            __unkeyed.__raw = ''
              function()
                  local conform = require("conform")
                  local formatters = conform.list_formatters(0)
                  if #formatters == 0 then
                      return ""
                  end
                  local names = {}
                  for _, formatter in ipairs(formatters) do
                      table.insert(names, formatter.name)
                  end
                  return table.concat(names, ", ")
              end
            '';
            icon = " ";
            color.fg = "#a6e3a1";
          }
          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };
}
