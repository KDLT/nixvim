{
  plugins.startify = {
    enable = true;
    settings = {
      change_to_dir = false;
      use_unicode = true; # if 1, and encoding is utf-8 unicode box drawings will be used instead
      lists = [ { type = "dir"; } ];
      files_number = 30;
      skiplist = [ "flake.lock" ];
    };
  };
}
