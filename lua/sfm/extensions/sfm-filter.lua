local event = require "sfm.event"
local config = require "sfm.extensions.sfm-filter.config"
local api = require "sfm.api"

local M = {
  filter_enabled = true,
}

--- check if the given entry can be renderable
local function is_renderable(entry)
  if !config.opts.show_hidden then
    if string.match(entry.name, "^[^.]") == nil then
      -- hidden
      return false
    end
  end

  return not (config.opts.ignore_names[entry.name] and true or false)
end

--- reload the explorer
function M.reload()
  local entry = api.entry.current()

  api.explorer.reload()

  -- re-focus the current entry
  api.navigation.focus(entry.path)
end

--- toggle hidden/ names... filter
function M.toggle_filter()
  M.filter_enabled = not M.filter_enabled

  M.reload()
end

function M.setup(sfm_explorer, opts)
  config.setup(opts)

  sfm_explorer:subscribe(event.ExplorerOpened, function(payload)
    local bufnr = payload["bufnr"]
    local options = {
      noremap = true,
      silent = true,
      expr = false,
    }

    if type(config.opts.mappings.toggle_filter) == "table" then
      for _, key in pairs(config.opts.mappings.toggle_filter) do
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          key,
          "<CMD>lua require('sfm.extensions.sfm-filter').toggle_filter()<CR>",
          options
        )
      end
    else
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        config.opts.mappings.toggle_filter,
        "<CMD>lua require('sfm.extensions.sfm-filter').toggle_filter()<CR>",
        options
      )
    end
  end)

  sfm_explorer:register_entry_filter("sfm-filter", function(entry)
    if not M.filter_enabled then
      return true
    end

    return is_renderable(entry)
  end)
end

return M
