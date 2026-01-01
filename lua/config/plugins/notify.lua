return {
  "rcarriga/nvim-notify",
  event = "VeryLazy", -- or remove to load immediately
  opts = {
    render = "default",       -- "minimal", "compact", "wrapped-compact" are nice too
    stages = "fade_in_slide_out",
    timeout = 2000,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify -- override default
  end,
}
