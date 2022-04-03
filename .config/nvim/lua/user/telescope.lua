local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {},
    },
  file_ignore_patterns = {
	{ "node_modules" }
  }
  pickers = {},
  extensions = {},
}
