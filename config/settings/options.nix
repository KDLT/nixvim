{
  opts = {
    updatetime = 100; # allegedly faster completion
    timeoutlen = 300; # ms to wait for mapped sequence to complete
    cmdheight = 0; # 0 hides command line entirely

    number = true;
    relativenumber = true;
    # mouse = "a"; # enable mouse control

    swapfile = false; # disable swap file
    undofile = true; # automatic undo history
    incsearch = true; # show match for partly typed search
    inccommand = "split"; # search and replace preview changes in quickfix list
    ignorecase = true; # match queries even if not matching case
    smartcase = true; # smarter ignorecase
    scrolloff = 9999; # number of lines to keep around the cursor, high number ensures middle
    cursorline = true; # highlight screen horizontal line of cursor
    cursorcolumn = false; # highlight screen vertical line of cursor
    signcolumn = "yes"; # show the sign column
    colorcolumn = "100"; # nth column to highlight, "soft break"

    laststatus = 3; # when to use status line for last window, 3 for always and ONLY last window
    fileencoding = "utf-8"; # file encoding for current buffer
    termguicolors = true; # enable 24-bit color in tui
    spell = false; # do not highlight spelling mistakes in local window
    wrap = false; # do not wrap text

    splitright = true;
    splitbelow = true;
    splitkeep = "screen";

    tabstop = 2; # number of spaces a tab stands in for
    shiftwidth = 2; # number of spaces for each auto-indent
    expandtab = true; # expand tab to spaces in insert mode
    autoindent = true; # "clever" autoindenting
    smartindent = true; # indent on new line

    # textwidth = 0; # ensures inserted line won't break
    # foldlevel = 99; # folds with higher level than this will be closed
  };
}
