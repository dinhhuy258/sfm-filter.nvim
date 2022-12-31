local M = {
  opts = {},
}

local default_config = {
  show_hidden = false,
  mappings = {
    toggle_hidden_filter = { "." },
  },
}

function M.setup(opts)
  M.opts = default_config

  if opts == nil then
    return
  end

  if opts.show_hidden ~= nil then
    M.opts.show_hidden = opts.show_hidden
  end

  if opts.mappings ~= nil and opts.mappings.toggle_hidden_filter ~= nil then
    M.opts.mappings.toggle_hidden_filter = opts.mappings.toggle_hidden_filter
  end
end

return M
