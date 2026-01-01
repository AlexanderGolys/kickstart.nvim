



vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'nvi'
vim.opt.showmode = false




-- vim.opt.autowriteall = true


vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
-- vim.opt.smartcase = 

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 1000

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mousemoveevent = false

vim.opt.mousescroll = "ver:1,hor:1"

vim.opt.wrap = false

vim.opt.winborder = 'rounded'

vim.opt.sessionoptions = {
  "blank",
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "winpos",
  "folds",
  "terminal",
}

-- the g (global) flag is inserted after substitute by default
vim.opt.gdefault = true
