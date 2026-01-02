return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
	  lazy = false,  
    opts = {
      -- 1. Add 'macaulay2' to this list so it installs automatically
      ensure_installed = { 'bash', 'c', 'cpp', 'javascript', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go', 'macaulay2'},
      auto_install = true,
      highlight = {
        enable = true,
      },
      incremental_selection = {enable = true}, 
      indent = { enable = true },
    },

    -- 2. Use a config function to register the local parser
       config = function()
      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
vim.opt.runtimepath:prepend(vim.fn.expand("~/Desktop/m2treesitter/tree-sitter-macaulay2"))
      -- Register macaulay2 parser
      parser_configs.macaulay2 = {
        install_info = {
          url = vim.fn.expand("~/Desktop/m2treesitter/tree-sitter-macaulay2"),
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "macaulay2",
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "macaulay2" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,  }
}
