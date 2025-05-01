# workspace-config.nvim

💼 Neovim 用の軽量プラグイン — プロジェクトごとの設定ファイル (`.nvim/init.lua`) を自動で読み込み、VSCode の `workspace.json` のようなプロジェクトごとの機能設定を再現します。

---

## ✨ このプラグインでできること

- Neovim 起動時に `.nvim/init.lua` を自動読み込み
- 別プロジェクトに移動したとき（`:cd` や `BufEnter`）にも再読み込み
- 同一プロジェクトでは再読み込みをスキップして最適化
- `:WorkspaceConfigReload` コマンドで手動再読み込みも可能

---

## 📁 プロジェクト構成例

```
my-project/
├── .nvim/
│   └── init.lua    ← プロジェクト固有の設定を書く
├── src/
│   └── main.lua
└── ...
```

---

## 🛠️ インストール方法

### lazy.nvim を使う場合

```lua
{
  "sika7/workspace-config.nvim",
  config = function()
    -- 初期設定は不要ですが、必要ならここに
  end
}
```

### vim-plug を使う場合

```vim
Plug 'sika7/-config.nvim'
```

---

## 🧪 `.nvim/init.lua` の記述例

```lua
-- Lua で Neovim 設定を書けます（通常の init.lua と同じ）
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.keymap.set("n", "<leader>r", ":!npm run dev<CR>", { silent = true })
```

---

## 🧩 利用可能なコマンド

| コマンド                 | 説明                                 |
| ------------------------ | ------------------------------------ |
| `:WorkspaceConfigReload` | 現在の `.nvim/init.lua` を再読み込み |

---

## 🔍 動作の仕組み

1. `git rev-parse --show-toplevel` で Git ルートを取得
2. 見つからない場合は `vim.loop.cwd()` で現在の作業ディレクトリを使用
3. `.nvim/init.lua` があれば `dofile()` で読み込み
4. 同一パスなら再読み込みしないようにキャッシュ

---

## ⚠️ セキュリティについて

`.nvim/init.lua` は Lua コードとして直接実行されます。信頼できるプロジェクトでのみ使用してください。

---

## 📄 ライセンス

MIT License

---

## 🙏 クレジット

本プラグインは、VSCode のように Neovim においてもプロジェクト単位で設定管理を行えるようにすることを目的として開発されました。
