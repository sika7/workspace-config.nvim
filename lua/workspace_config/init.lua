local M = {}
local last_loaded_path = nil

-- Gitルート or CWD を返す
local function get_project_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_root and git_root ~= "" then
    return git_root
  else
    return vim.loop.cwd()
  end
end

-- workspace.lua を読み込む
function M.load()
  local root = get_project_root()
  if root == last_loaded_path then
    return -- 同じプロジェクトなら再読み込みしない
  end

  local config_path = root .. "/.nvim/workspace.lua"
  if vim.fn.filereadable(config_path) == 1 then
    local ok, _ = pcall(dofile, config_path)
    if ok then
      vim.notify("[workspace-config] Loaded: " .. config_path)
      last_loaded_path = root
    end
  end
end

return M
