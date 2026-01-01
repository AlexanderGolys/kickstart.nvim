return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
	  lazy = false,  
    opts = {
      -- 1. Add 'macaulay2' to this list so it installs automatically
      ensure_installed = { 'bash', 'c', 'cpp', 'javascript', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go' },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },

    -- 2. Use a config function to register the local parser
    config = function(_, opts)
	    vim.opt.runtimepath:append("~/Desktop/m2treesitter/tree-sitter-macaulay2")
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.macaulay2 = {
        install_info = {
          url = "~/Desktop/m2treesitter/tree-sitter-macaulay2", -- Local path to your repo
          files = { "src/parser.c" }, -- Note: if you have a scanner.c, add it here like { "src/parser.c", "src/scanner.c" }
          branch = "main", -- default branch in case of git repo if the url was a git url
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "m2", -- if filetype does not match the parser name
      }

      -- 3. Run the standard setup
      require('nvim-treesitter.configs').setup(opts)
    end
  }
}
