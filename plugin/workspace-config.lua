-- プラグインが読み込まれるときの処理
if vim.g.loaded_workspace_config then
  return
end
vim.g.loaded_workspace_config = true

local wsconfig = require("workspace_config")

-- 起動時に自動で設定ファイルを探して読み込む
vim.api.nvim_create_augroup("workspace_config_auto", { clear = false })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "workspace_config_auto",
  callback = function()
    wsconfig.load()
  end,
})

-- カレントディレクトリ変更時（例: :cd, TelescopeProjects, autochdir）
vim.api.nvim_create_autocmd("DirChanged", {
  group = "workspace_config_auto",
  callback = function()
    wsconfig.load()
  end,
})

-- バッファに入ったとき（他プロジェクトのファイルを開いたとき）
vim.api.nvim_create_autocmd("BufEnter", {
  group = "workspace_config_auto",
  callback = function()
    wsconfig.load()
  end,
})

vim.api.nvim_create_user_command("WorkspaceConfigReload", function()
  wsconfig.load()
end, {})
