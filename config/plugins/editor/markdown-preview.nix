{
  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 1;
        auto_start = 1;
        browser = "firefox";
        echo_preview_url = 1;
        highlight_css = {
          __raw = "vim.fn.expand('~/highlight.css')";
        };
        markdown_css = "/Users/username/markdown.css";
        page_title = "「\${name}」";
        port = "8080";
        preview_options = {
          disable_filename = 1;
          disable_sync_scroll = 1;
          sync_scroll_type = "middle";
        };
        theme = "dark";
      };
    };
  };
}
