-- local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_augroup

-- local hooks = function(ev)
--   -- Use available |event-data|
--   local name, kind = ev.data.spec.name, ev.data.kind
--   -- Run build script after plugin's code has changed
--   if name == 'fzf' and (kind == 'install' or kind == 'update') then
--     -- Append `:wait()` if you need synchronous execution
--     vim.system({ 'make' }, { cwd = ev.data.path })
--   end
-- end
--
-- -- If hooks need to run on install, run this before `vim.pack.add()`
-- -- To act on install from lockfile, run before very first `vim.pack.add()`
-- autocmd('PackChanged', { callback = hooks })

