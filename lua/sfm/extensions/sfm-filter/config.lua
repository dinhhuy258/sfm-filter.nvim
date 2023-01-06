local M = {
  opts = {},
}

local default_config = {
  show_hidden = false,
  ignore_names = {},
  mappings = {
    toggle_filter = { "." },
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

  if opts.ignore_names ~= nil and type(opts.ignore_names) == "table" then
    for _, ignore_name in ipairs(opts.ignore_names) do
      M.opts.ignore_names[ignore_name] = true
    end
  end

  if opts.mappings ~= nil and opts.mappings.toggle_filter ~= nil then
    M.opts.mappings.toggle_filter = opts.mappings.toggle_filter
  end
end

return M
