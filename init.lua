
--- must be set before any plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\' 

vim.filetype.add({
     extension = {
    m2 = 'macaulay2',
      },
})

require 'config.options'
require 'config.health'
require 'config.lazy'
require 'config.autocmd'
require 'config.keybinds'
require 'config.lsp'
require 'config.colorscheme'


vim.g.have_nerd_font = true



-- vim.cmd [[hi @error.macaulay2 guifg=red]] 
-- vim.cmd [[hi @variable.parameter.macaulay2 guifg=#CE85B5]]
-- vim.cmd [[hi @indexed_variable.macaulay2 guifg=#B4E3B2]]
