-- This little script is used for batch-renaming my photos with Base58 hashes.

local M = {}

-- Base58 is a subset of Base64, with ambiguous characters being removed.
local base58_chars = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

local function random_base58(n)
  math.randomseed(os.time())
  local result = {}
  for _ = 1, n do
    local index = math.random(1, #base58_chars)
    table.insert(result, base58_chars:sub(index, index))
  end
  return table.concat(result)
end

M.BatchRenameBase58 = function()
  local batch_id = random_base58(8)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local ext = function(path)
    return path:match("^.+(%..+)$") or ""
  end

  local renamed = {}
  for i, _ in ipairs(lines) do
    local newname = string.format("unknown-%s_%08d", batch_id, i)
    local extension = ext(lines[i])
    renamed[i] = newname .. extension
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, renamed)
end

return M
