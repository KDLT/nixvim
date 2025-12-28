{
  # keymaps.nix
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<Space>";
      action = "<NOP>";
      options.desc = "Global Leader Key";
    }
    {
      key = "<Esc>";
      mode = [ "n" ];
      action = ":noh<CR>";
      options.desc = "clear highlights";
    }
    {
      key = "<leader>|";
      mode = [ "n" ];
      action = "<Cmd>vsp<CR>";
      options.desc = "Split Window Right";
    }
    {
      key = "<leader>-";
      mode = [ "n" ];
      action = "<Cmd>sp<CR>";
      options.desc = "Split Window Below";
    }
    {
      key = "<C-c>";
      mode = [ "n" ];
      action = ":b#<CR>";
      options.desc = "back and forth between two most recent buffers";
    }
    {
      key = "<C-x>";
      mode = [ "n" ];
      action = ":close<CR>";
      options.desc = "close window via Ctrl+x, this cannot close the last window";
    }
    {
      key = "<leader>s";
      mode = [ "n" ];
      action = ":w<CR>";
      options.desc = "Save Buffer";
    }
    {
      key = "<C-h>";
      mode = [ "n" ];
      action = "<C-w>h";
      options.desc = "Navigate to Left window";
    }
    {
      key = "<C-l>";
      mode = [ "n" ];
      action = "<C-w>l";
      options.desc = "Navigate to Right window";
    }
    #   # even though C-j and C-k are the same keybinds for picking autosuggests, those happen in insert mode
    #   # but i don't think i'll bother splitting vertically
    {
      key = "<C-j>";
      mode = [ "n" ];
      action = "<C-w>j";
      options.desc = "Navigate to Bottom window";
    }
    {
      key = "<C-k>";
      mode = [ "n" ];
      action = "<C-w>k";
      options.desc = "Navigate to Top window";
    }
    {
      key = "<C-Up>";
      mode = [ "n" ];
      action = ":resize +2<CR>";
      options.desc = "grow horizontal current window";
    }
    {
      key = "<C-Down>";
      mode = [ "n" ];
      action = ":resize -2<CR>";
      options.desc = "shrink horizontal current window";
    }
    {
      key = "<C-Left>";
      mode = [ "n" ];
      action = ":vertical resize -2<CR>";
      options.desc = "shrink vertical current window";
    }
    {
      key = "<C-Right>";
      mode = [ "n" ];
      action = ":vertical resize +2<CR>";
      options.desc = "grow vertical current window";
    }
    # Rust/Cargo-specific keybindings and commands
    {
      mode = [ "n" ];
      key = "<leader>rc";
      action = ":!cargo check<CR>";
      options.desc = "Cargo check";
    }
    {
      mode = [ "n" ];
      key = "<leader>rb";
      action = ":!cargo build<CR>";
      options.desc = "Cargo build";
    }
    {
      mode = [ "n" ];
      key = "<leader>rr";
      action = ":!cargo run<CR>";
      options.desc = "Cargo run";
    }
    {
      mode = [ "n" ];
      key = "<leader>rt";
      action = ":!cargo test<CR>";
      options.desc = "Cargo test";
    }
    {
      mode = [ "n" ];
      key = "<leader>rr";
      action = ":!cargo test -- --noapture<CR>";
      options.desc = "Cargo test (show output)";
    }
    {
      mode = [ "n" ];
      key = "<leader>rC";
      action = ":!cargo clippy<CR>";
      options.desc = "Cargo clippy";
    }
    {
      mode = [ "n" ];
      key = "<leader>rd";
      action = ":!cargo doc --open<CR>";
      options.desc = "Cargo doc (open)";
    }
    ## VISUAL: keeps the highlight intact after indenting
    {
      key = ">";
      mode = [ "v" ];
      action = ">gv";
      options.desc = "Keep highlighting intact after indenting";
    }
    {
      key = "<TAB>";
      mode = [ "v" ];
      action = ">gv";
      options.desc = "Keep highlighting intact after indenting";
    }
    {
      key = "<";
      mode = [ "v" ];
      action = "<gv";
      options.desc = "Keep highlighting intact after de-indenting";
    }
    {
      key = "<S-TAB>";
      mode = [ "v" ];
      action = "<gv";
      options.desc = "Keep highlighting intact after de-indenting";
    }
    ## VISUAL: move selected line/block of text in visual mode
    {
      key = "K";
      mode = [ "v" ];
      action = ":m '<-2<CR>gv=gv";
      options.desc = "move selected lin/block up in visual mode";
    }
    {
      key = "J";
      mode = [ "v" ];
      action = ":m '>+1<CR>gv=gv";
      options.desc = "move selected lin/block up in visual mode";
    }
  ];
}
