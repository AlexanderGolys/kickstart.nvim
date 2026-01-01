-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`


-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
local map = vim.keymap.set




local map_n = function(lhs, rhs, description)
	map('n', lhs, rhs, {desc = description })
end


local map_all = function(lhs, rhs, description)
	map({'n', 'c', 'v', 'i', 't'}, lhs, rhs, {desc = description })
end

local map_noti = function(lhs, rhs, description)
	map({'n', 'v'}, lhs, rhs, {desc = description })
end

local config_file = function(relative)
  return  vim.fn.stdpath('config') .. '/' .. relative
end

local open_command = function(file)
	return '<cmd>e ' .. file .. '<cr>'
end




local shift_rep = 3



map_n('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- map_n('<leader>q', vim.diagnostic.setloclist,  'Open diagnostic [Q]uickfix list' )

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>',  {desc = 'Exit terminal mode'} )

-- TIP: Disable arrow keys in normal mode
map_n('<left>', '<C-w>h',  'Switch to left window' )
map_n('<right>', '<C-w>l',  'Switch to right window' )
map_n('<up>', '<C-w>k',  'Switch to upper window' )
map_n('<down>', '<C-w>j',  'Switch to down window' )

-- @Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map_n('<M-l>', '<C-w>v<C-]><C-w><S-t>',  'go one word to the left')
-- map_n('<C-l>', '<S-Right>',  'go one word to the right')
-- map_n('<C-j>', '<C-d>',  'Jump half screen down')
-- map_n('<C-k>', '<C-u>',  'Jump half screen up')





-- Tree sitter inspections
map_n('<leader>tu', '<cmd>TSUpdate<CR>',  '[T]ree-sitter [U]pdate')
map_n('<leader>tt', '<cmd>InspectTree<CR>',  '[T]ree-sitter Inspect [T]ree')
map_n('<leader>ti', '<cmd>Inspect<CR>',  '[T]ree-sitter [I]nspect Word Under Cursor')

-- Quick access: config files
map_n('<leader>ck', 
  open_command(config_file 'lua/config/keybinds.lua'), 
  '[C]onfig: [k]eybinds.lua file')

map_n('<leader>cl', 
  open_command(config_file 'lua/config/plugins/lsp.lua'),  
  '[C]onfig: [l]sp.lua file')

map_n('<leader>ct', 
  open_command(config_file 'lua/config/plugins/telescope.lua'),  
  '[C]onfig: [t]elescope.lua file')

map_n('<leader>ci', 
  open_command(config_file 'init.lua'), 
  '[C]onfig: [i]nit.lua file')

map_n('<leader>co', 
  open_command(config_file 'lua/config/options.lua'), 
  '[C]onfig: [o]ptions.lua file')

map_n('<leader>ca', 
  open_command(config_file 'lua/config/autocmd.lua'), 
  '[C]onfig: [a]utocmd.lua file')





-- Session ending/loading
--
map_all("<End>", "<cmd>SoftW<cr><cmd>SaveSession<cr><cmd>q<cr>", "Save and Quit Window")
--
map_all("<C-End>", "<cmd>SoftWA<cr><cmd>SaveSession<cr><cmd>qa<cr>", "Save and Quit Window")

map_all("<C-S>", "<cmd>SoftWA<cr><cmd>SaveSession<cr>", "Save All")

map_all("<Home>", "<cmd>LoadLastSession<cr>", "Load Last Session")




-- map_noti("gp",  '"_dP',  "Paste over selection(keep yank)")

-- Oil: File explorer 
map_n('<leader>oo', '<cmd>Oil<cr>', '[O]il file expl[o]rer (current dir)')

