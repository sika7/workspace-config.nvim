# workspace-config.nvim

💼 Lightweight plugin for Neovim that automatically loads per-project settings from `.nvim/init.lua`, similar to VSCode's `init.json`.

---

## ✨ Features

- Automatically loads `.nvim/init.lua` on startup
- Reloads configuration when switching to another project
- Prevents redundant reloads for the same project
- Provides a manual reload command: `:WorkspaceConfigReload`

---

## 📁 Example Project Structure

```plaintext
my-project/
├── .nvim/
│   └── init.lua   ← Put your project-specific config here
├── src/
│   └── main.lua
└── ...
```

---

## 🛠️ Installation

### lazy.nvim

```lua
{
  "sika7/workspace-config.nvim",
  config = function()
    -- Optional setup
  end,
}
```

### vim-plug

```vim
Plug 'sika7/workspace-config.nvim'
```

---

## 🧪 Example `.nvim/init.lua`

```lua
-- Any Lua-based Neovim config
vim.keymap.set("n", "<leader>r", ":!npm run dev<CR>", { silent = true })
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
```

---

## 🔧 Commands

| Command                  | Description                           |
| ------------------------ | ------------------------------------- |
| `:WorkspaceConfigReload` | Reloads the workspace config manually |

---

## 🔍 How it works

- Attempts to locate the Git root using `git rev-parse --show-toplevel`
- Falls back to `vim.loop.cwd()` if Git is not available
- Loads `.nvim/init.lua` if it exists at that root
- Avoids duplicate loads using an internal cache

---

## ⚠️ Security

Since `workspace.lua` is executed as Lua code, only use this in trusted projects.

---

## 📄 License

MIT License

---

## 🙌 Credits

This plugin aims to bring project-local configuration to Neovim, inspired by VSCode’s workspace settings.
