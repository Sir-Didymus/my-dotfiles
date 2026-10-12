# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration (written in Lua) using `lazy.nvim` as the
plugin manager. There is no build step; "testing" a change means restarting/reloading
Neovim and checking it starts without errors.

## Common commands

- **Reload config after changes**: open Neovim and run `:source %` for a single file,
  or restart Neovim entirely for changes to `init.lua` / plugin specs.
- **Sync/install/update plugins**: `:Lazy sync` (or `:Lazy` to open the UI).
- **Install/update LSP servers & tools**: `:Mason` (UI) — `mason-tool-installer` also
  auto-installs/updates the formatters/linters listed in
  `lua/plugins/lsp/mason-tool-installer.lua` on startup.
- **Headless sanity check** (useful for verifying the config loads without errors
  after an edit, without a user watching):
  `nvim --headless "+Lazy! sync" +qa`
- **Lint Lua**: `luacheck lua` (rules in `.luacheckrc`: ignores unused `_`-prefixed
  args/vars and globals/fields set on `vim`).
- **Format Lua**: formatting is delegated to `stylua` via `efm-langserver` (see below),
  invoked from inside Neovim with `<leader>fe`, not as a standalone CLI step here.

## Architecture

### Load order

`init.lua` only requires `config.lazy`. `lua/config/lazy.lua` then, in order:
1. Sets `g:mapleader` / `g:maplocalleader` via `config.globals` (must happen before
   `lazy.nvim` loads so mappings register correctly).
2. Applies `config.options` (vim options) and `config.keymap` (global keymaps).
3. Loads `util.icons` (configures `vim.diagnostic` signs globally).
4. Bootstraps and calls `lazy.nvim`'s `setup()`, importing plugin specs from three
   directories: `lua/plugins/` (general plugins), `lua/plugins/lsp/` (LSP-stack
   plugins), and `lua/plugins/ai/` (AI/LLM plugins). Every `.lua` file in those
   directories must `return` a lazy.nvim plugin spec table — lazy auto-discovers them,
   there is no central plugin list to edit.

### LSP stack (new-style `vim.lsp.config`, not `lspconfig.setup{}`)

This config uses Neovim's built-in `vim.lsp.enable()` / `vim.lsp.config()` API rather
than calling `require("lspconfig").<server>.setup{}` per server:

- `lua/plugins/lsp/mason.lua` / `mason-lspconfig.lua` / `mason-tool-installer.lua`:
  install LSP servers and third-party linters/formatters via Mason. Exception:
  JVM-based Scala tooling (`metals`, `scalafmt`) isn't in the Mason registry at all —
  install the prebuilt artifacts via [coursier](https://get-coursier.io)
  (`cs install metals` / `cs install scalafmt`; on Arch, `cs` itself comes from the
  AUR `coursier-bin` package — avoid the AUR `metals` package, which builds from
  source via sbt and breaks under newer JDKs). Only commented-out, documented
  entries are left in the `ensure_installed` lists as a pointer to this.
- `lua/plugins/lsp/nvim-lspconfig.lua`: the single place that calls
  `vim.lsp.enable("<server>")` for every server in use. **To add a new LSP server,
  it must be enabled here.**
- `after/lsp/<server>.lua`: one file per server, each returning a settings table
  (`capabilities`, `on_attach`, `settings`, `cmd`, etc.). Neovim automatically sources
  the matching file here when a server is enabled — this is where per-server
  configuration actually lives, not in `nvim-lspconfig.lua`.
- `lua/util/lsp.lua`: shared `on_attach` applied by every server config. Defines the
  common LSP keymaps (all via Lspsaga: `<leader>fd` finder, `gd`/`gD` definition,
  `K` hover, `<leader>ca` code action, `<leader>d`/`<leader>D` diagnostics,
  `<leader>rn` rename), enables inlay hints when supported, and wires up
  `<leader>fe` (format via efm) / `<leader>fl` (format via the native LSP client)
  depending on whether the attaching client is `efm`.
- `lua/util/capabilities.lua`: shared `capabilities()` built from `cmp_nvim_lsp`,
  used by every server config (and every `after/lsp/*.lua` file imports both of these
  util modules).

### Formatting & linting via efm-langserver

`after/lsp/efm.lua` configures `efm-langserver` (enabled like any other server in
`nvim-lspconfig.lua`) as a meta-server that runs real linters/formatters through LSP,
using pre-built definitions from `efmls-configs-nvim` (e.g. `prettier_d`, `stylua`,
`black`/`ruff`, `clang_format`/`clang_tidy`, `sqlfluff`/`sqruff`, `markdownlint`, etc.).
The per-language tool list lives in `efm_settings.settings.languages` in that file.
Markdownlint is pointed at the repo's own `markdownlint.json`. The actual binaries
(`stylua`, `black`, `ruff`, `markdownlint`, ...) are kept up to date by
`mason-tool-installer.lua` — when adding a new filetype to efm, add the tool to
*both* `efm.lua` (language mapping) and `mason-tool-installer.lua` (ensure_installed).
Not every language needs a separate linter entry here: for Rust and Scala, only a
formatter (`rustfmt`, `scalafmt`) is wired through efm — diagnostics come from the
language's own LSP server (`rust_analyzer`, `metals`) instead.

### AI integration

`lua/plugins/ai/codecompanion.lua` configures `codecompanion.nvim` plus the
`codecompanion-history` extension (chat history, auto-generated titles, summaries,
and an optional VectorCode-backed memory system). Notably, on setup it looks for a
project-local `.rules/rules.lua` (relative to `getcwd()`) in whatever project is open
and, if present, loads it to populate a `Project` rules group — this is how
per-project custom rules get fed into CodeCompanion. `<leader>cca` opens the actions
menu, `<leader>cct` toggles the chat window.

### Utility modules (`lua/util/`)

Besides `lsp.lua`/`capabilities.lua`/`icons.lua` described above, `rename.lua` and
`rename_random.lua` are standalone batch-rename helpers (Base58 filename generation
for renaming photos in a buffer of filenames), exposed as the `:BatchRenameBase58`
user command defined in `lua/config/keymap.lua`.
