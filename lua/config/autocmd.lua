

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


local function save_session(name)
  name = name or "last-session.vim"
  local path = vim.fn.stdpath("state") .. "/" .. name
  vim.cmd("mksession! " .. vim.fn.fnameescape(path))
  vim.notify("Saved session: " .. path)
end

local function load_session(name)
  name = name or "last-session.vim"
  local path = vim.fn.stdpath("state") .. "/" .. name
  vim.cmd("source " .. vim.fn.fnameescape(path))
  vim.notify("Loaded session: " .. path)
end

vim.api.nvim_create_user_command("SaveSessionAs", 
  function(opts) save_session(opts.args) end, 
  { nargs = 1, complete = "file" })

vim.api.nvim_create_user_command("SaveSession", 
  function(_) save_session() end, 
  { nargs = 0 })

vim.api.nvim_create_user_command("LoadSession", 
  function(opts) load_session(opts.args) end, 
  { nargs = 1, complete = "file" })

vim.api.nvim_create_user_command("LoadLastSession", 
  function(_) load_session() end, 
  { nargs = 0 })


vim.api.nvim_create_user_command("SoftW", function()
  if vim.bo.modifiable and not vim.bo.readonly then
    vim.cmd.write()
    vim.notify("Saved current file")
  elseif vim.bo.modifiable then 
    vim.notify("Current file not saved: Read Only ")
  else 
    vim.notify("Failed to save current file: not modifiable")
  end 

end, {})

vim.api.nvim_create_user_command("SoftWA", function()
  local i = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local modified   = vim.api.nvim_buf_get_option(buf, "modified")
      local modifiable = vim.api.nvim_buf_get_option(buf, "modifiable")
      local readonly   = vim.api.nvim_buf_get_option(buf, "readonly")
      if modifiable and not readonly and not modified then
        pcall(vim.api.nvim_buf_call, buf, function()
          vim.cmd.write()
          i = i + 1 
        end)
      end
    end
  end
  if i > 0 then 
    vim.notify("Saved " .. i .. " files.")
  end 
end, {})

vim.api.nvim_create_autocmd("SwapExists", {
  callback = function() vim.v.swapchoice = "e" end,
})
