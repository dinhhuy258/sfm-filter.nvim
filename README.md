# sfm-entry

The `sfm-entry` extension is a plugin for the [sfm](https://github.com/dinhhuy258/sfm.nvim) plugin that allows users to filter entries in the sfm explorer.

## Installation

To install the `sfm-entry` extension, you will need to have the [sfm](https://github.com/dinhhuy258/sfm.nvim) plugin installed. You can then install the extension using your preferred plugin manager. For example, using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
{
  "dinhhuy258/sfm.nvim",
  requires = {
    { "dinhhuy258/sfm-filter.nvim" },
  },
  config = function()
    local sfm_explorer = require("sfm").setup {}
    sfm_explorer:load_extension "sfm-filter"
  end
}
```

## Configuration

The `sfm-filter` plugin provides the following configuration options:

```lua
local default_config = {
  show_hidden = false,
  ignore_names = {},
  ignore_extensions = {},
  mappings = {
    toggle_filter = { "." },
  },
}
```

You can override the default configuration in `load_extension` method

```lua
sfm_explorer:load_extension("sfm-filter", {
  show_hidden = false,
  ignore_names = {
    "node_modules"
  },
  ignore_extensions = {
    "env"
  },
  mappings = {
    toggle_filter = { "." },
  },
})
```
