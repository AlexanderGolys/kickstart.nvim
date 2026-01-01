return {
  -- 1. Copilot Core (Completions)
  {
    'zbirenbaum/copilot.lua',
	  cmd = "Copilot",
  event = "InsertEnter",
    config = function()
      require('copilot').setup {
        suggestion = {
    	eenabled = true,
    	aauto_trigger = false,
         hide_during_completion = true,
         debounce = 75,
         trigger_on_accept = true,
         keymap = {
           accept = "<kEnter>",
           accept_word = "k0",
           accept_line = false,
           next = "kPlus",
           prev = "<kPoint",
           dismiss = "<kMinus>",
    }},
  
	panel = { enabled = false }, -- Disable the side panel if you prefer ghost text
        filetypes = {
	 javascript = true ,
	 lua = true 
	}
	}

    end,
  },


}
