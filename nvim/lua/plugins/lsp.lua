-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function _1_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local before_init
  local function _2_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _2_
  local on_attach
  local function _3_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "fd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fb", "<C-O>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ft", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fe", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fa", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fa", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fw", ":lua require('telescope.builtin').diagnostics()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _3_
  lsp.ts_ls.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
  return lsp.clojure_lsp.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
end
return {{"neovim/nvim-lspconfig", config = _1_}}
