# Nixvim Configuration Improvement TODO

This document tracks suggested improvements and cleanup tasks for the nixvim configuration.

## 🔴 HIGH PRIORITY - Remove or Configure

### 1. DAP (Debug Adapter Protocol) - UNCONFIGURED
**File**: `config/plugins/utils/dap.nix`

**Problem**: DAP is enabled but has zero configuration. It's non-functional.

**Decision needed**:
- [ ] Configure DAP for languages you actually debug (Python, JavaScript, etc.)
- [ ] Remove the plugin entirely if you don't debug in Neovim

**Current state**:
```nix
plugins.dap = {
  enable = true;  # NO configuration!
};
```

---

### 2. trim.nvim Plugin - REDUNDANT ✅ COMPLETED
**File**: `config/plugins/utils/trim.nix`

**Problem**: This plugin trims whitespace on save, but ALL your formatters (deno_fmt, prettierd, nixfmt, etc.) already do this. It's adding unnecessary overhead.

**Action**:
- [x] DELETE this file entirely - your formatters handle whitespace cleanup

**Completed**: Removed trim.nvim and added toggleterm.nvim instead

---

### 3. Duplicate File Explorers
**Files**:
- `config/plugins/editor/neo-tree.nix` (bound to `<leader>e`)
- `config/plugins/editor/oil.nix` (bound to `<leader>t`)

**Problem**: You have TWO file explorers configured. Most people only need one.

**Decision needed**:
- [ ] Keep Neo-tree (traditional sidebar tree view)
- [ ] Keep Oil (buffer-based file editing)
- [ ] Remove the one you don't use

---

### 4. lsp-lines - Potentially Noisy
**File**: `config/plugins/lsp/lsp.nix:19`

**Current**: `lsp-lines.enable = true;`

**Problem**: Shows diagnostics inline in the buffer. Can be visually cluttered.

**Decision needed**:
- [ ] Keep if you find inline diagnostics useful
- [ ] Disable if it's too noisy

---

## 🟡 MEDIUM PRIORITY - Review & Clean

### 5. Development Shell Languages
**File**: `config/shell.nix`

**Current languages**: Rust, Go, Elixir, F#, Gleam, Kotlin

**Question**: Do you actually use all these languages?

**Action**:
- [ ] Review which languages you actually need
- [ ] Remove unused ones to speed up `nix develop`

---

### 6. Startify Plugin
**File**: `config/plugins/ui/startify.nix`

**Purpose**: Shows a start screen with recent files

**Decision needed**:
- [ ] Keep if you use the start screen
- [ ] Remove if it's just visual clutter you skip past

---

### 7. Virt-column - REDUNDANT
**File**: `config/plugins/ui/virt-column.nix`

**Problem**: Shows a vertical line at column 100, but you already have `colorcolumn = "100"` in `config/settings/options.nix:21`

**Action**:
- [ ] Remove virt-column plugin (redundant)
- [ ] OR remove the colorcolumn option (prefer plugin)

---

### 8. Mini.nvim
**File**: `config/plugins/utils/mini.nix`

**Note**: Need to review what mini modules are enabled

**Action**:
- [ ] Read the file and verify which mini.nvim modules you're using
- [ ] Remove unused modules

---

### 9. Auto-session
**File**: `config/plugins/utils/auto-session.nix`

**Purpose**: Automatically saves and restores Neovim sessions

**Decision needed**:
- [ ] Keep if you regularly restore sessions
- [ ] Remove if you don't use this workflow

---

## 🟢 LOW PRIORITY - Configuration Quality

### 10. Telescope Symbols Action Without Plugin
**File**: `config/plugins/utils/telescope.nix:58-61`

**Problem**: Keybinding `<leader>fs` for symbols, but no symbols plugin is configured

**Action**:
- [ ] Add `telescope-symbols.nvim` plugin
- [ ] OR remove the keybinding

---

### 11. CodeSnap References - MISSING PLUGIN
**File**: `config/plugins/utils/which-key.nix:54-91`

**Problem**: CodeSnap keybindings defined, but CodeSnap plugin is not installed

**Action**:
- [ ] Add CodeSnap plugin to config
- [ ] OR remove the which-key entries

---

### 12. Commented-out Language Servers
**File**: `config/plugins/lsp/lsp.nix`

**Problem**: Many commented LSPs that clutter the file:
- pyright (line 50)
- gopls (line 51)
- terraformls (line 52)
- ansiblels (line 53)
- clangd (line 54)
- texlab (line 55)
- lua_ls (line 56)
- helm_ls (lines 63-95)

**Action**:
- [ ] Remove commented LSPs you'll never use
- [ ] Keep only ones you might enable in the future

---

### 13. Telescope Keybinding Duplication
**File**: `config/plugins/utils/telescope.nix`

**Problem**: Multiple keybindings for the same actions:
- `<leader><space>` AND `<leader>ff` both do find_files
- `<leader>/` AND `<leader>fg` both do live_grep
- `<C-f>` AND `<leader>ff` both do find_files

**Action**:
- [ ] Choose one convention and remove duplicates
- [ ] Document why duplicates exist if intentional

---

### 14. LSP Fallback Configuration
**File**: `config/plugins/lsp/conform.nix:88, 102`

**Current**: `lsp_fallback = true`

**Problem**: You've explicitly disabled LSP formatting for ts_ls, html, and marksman, but still have fallback enabled. This is confusing.

**Action**:
- [ ] Change to `lsp_fallback = false` for clarity
- [ ] OR document why fallback is needed

---

### 15. Mouse Support Commented Out
**File**: `config/settings/options.nix:9`

**Current**: `# mouse = "a"; # enable mouse control`

**Action**:
- [ ] Enable if you use mouse in Neovim
- [ ] Remove comment if you'll never use it

---

## 🎯 DEFINITELY ADD

### 16. LSP Keybindings - MISSING
**File**: `config/plugins/lsp/lsp.nix`

**Problem**: LSP servers are enabled, but no keybindings for common LSP features

**Action**:
- [ ] Add LSP keybindings:
  ```nix
  lsp = {
    enable = true;
    keymaps = {
      lspBuf = {
        gd = "definition";
        gr = "references";
        gi = "implementation";
        gt = "type_definition";
        "<leader>ca" = "code_action";
        "<leader>rn" = "rename";
        "<leader>f" = "format";  # or use conform instead
      };
      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
        "<leader>q" = "setloclist";
      };
    };
  };
  ```

---

### 17. Missing Formatters
**File**: `config/plugins/lsp/conform.nix`

**Current gaps**:
- No Python formatter (you have pylsp LSP)
- JSON could use deno_fmt
- CSS has no formatter

**Action**:
- [ ] Add Python formatter: `python = [ "black" ]` or `[ "ruff_format" ]`
- [ ] Add JSON: `json = [ "deno_fmt" ]`
- [ ] Add CSS: `css = [ "prettierd" ]`

---

### 18. Treesitter Language List
**File**: `config/plugins/editor/treesitter.nix`

**Problem**: No explicit language list - relies on defaults

**Action**:
- [ ] Add explicit ensure_installed list:
  ```nix
  settings = {
    ensure_installed = [
      "nix" "python" "javascript" "typescript"
      "html" "css" "bash" "json" "yaml"
      "markdown" "lua" "vim" "vimdoc"
    ];
  };
  ```

---

### 19. Git Conflict Resolution Plugin
**Missing**: Visual merge conflict resolution

**Action**:
- [ ] Consider adding `git-conflict.nvim` for merge conflicts
- [ ] OR document that you resolve conflicts externally

---

## 📋 Tracking Progress

**Status Key**:
- [ ] Todo
- [x] Completed
- [~] Decided against / Not needed

**Priority Counts**:
- 🔴 High Priority: 4 items
- 🟡 Medium Priority: 5 items
- 🟢 Low Priority: 6 items
- 🎯 Add Features: 4 items

**Total**: 19 items

---

## Notes

- This file tracks both removal ("trim the fat") and improvement suggestions
- Complete items can be checked off with `[x]`
- Items marked `[~]` mean they were considered and intentionally kept/rejected
- Add notes or decisions below each item as you work through them

---

## Decision Log

### Decisions Made
(Add dates and decisions here as you work through items)

- YYYY-MM-DD: Removed `_` formatter as it was causing cross-buffer formatting issues
- YYYY-MM-DD: Disabled lsp-format.nvim as it conflicted with conform.nvim
- YYYY-MM-DD: Disabled LSP formatting for ts_ls, html, and marksman to prevent conflicts

### Future Considerations
(Add potential future changes here)
