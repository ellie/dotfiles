local coq = require 'coq'
local saga = require 'lspsaga'
local nvim_lsp = require('lspconfig')

local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- setup coq for a server
local ensure = coq.lsp_ensure_capabilities

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

nvim_lsp.rust_analyzer.setup(ensure({}))

nvim_lsp.rls.setup(ensure({
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}))

nvim_lsp.tsserver.setup(ensure({}))

-- start up coq automatically
vim.cmd[[COQnow]]
