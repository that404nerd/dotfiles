require("bufferline").setup{
    groups = {
  options = {
    toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
  },
  items = {
    {
      name = "Tests", -- Mandatory
      highlight = {gui = "underline", guisp = "blue"}, -- Optional
      priority = 2, -- determines where it will appear relative to other groups (Optional)
      icon = "", -- Optional
      matcher = function(buf) -- Mandatory
        return buf.name:match('%_test') or buf.name:match('%_spec')
      end,
    },
    {
      name = "Docs",
      highlight = {gui = "undercurl", guisp = "green"},
      auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
      matcher = function(buf)
        return buf.name:match('%.md') or buf.name:match('%.txt')
      end,
      separator = { -- Optional
        style = require('bufferline.groups').separator.tab
      },
    }
  }
}
}

