-- TODO: 
-- learn about buffers
-- learn about snippet
-- gg=G is used to reindent file
-- add all wanted plugins
-- install LSP and configure it for cpp projects (among other)
-- clean packages in files

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { 'Failed to clone lazy.nvim:', 'ErrorMsg' }, { out, 'WarningMsg' } }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("mappings")
require("packages")
