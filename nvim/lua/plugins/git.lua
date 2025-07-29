-- [nfnl] Compiled from fnl/plugins/git.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local gitsigns = require("gitsigns")
  return gitsigns.setup({signs = {add = {text = "\226\148\130"}, change = {text = "\226\148\130"}, delete = {text = "_"}, topdelete = {text = "\226\128\190"}, changedelete = {text = "~"}}, signcolumn = true, numhl = true})
end
return {{"lewis6991/gitsigns.nvim", event = "BufReadPre", config = _1_}}
