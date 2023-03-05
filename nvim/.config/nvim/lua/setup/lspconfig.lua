local function setup()
  local cmp_loaded, cmp_capabilities = pcall(require, "cmp_nvim_lsp")
  local null_ls_loaded, null_ls = pcall(require, "null-ls")
  local lsp_loaded, lspconfig = pcall(require, "lspconfig")

  if not cmp_loaded and null_ls_loaded and lsp_loaded then return end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local format_on_save = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end -- format_on_save

  local default_capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = cmp_capabilities.default_capabilities(default_capabilities)

  lspconfig.lua_ls.setup({
    on_attach = format_on_save,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", },
        diagnostics = {
          globals = { "vim", "require" }
        }
      }
    },
  }) -- lua

  lspconfig.gopls.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  }) -- json
  lspconfig.eslint.setup({})

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.gofmt,
    },
    on_attach = function(client, bufnr)
      format_on_save(client, bufnr)
    end,
  }) -- null_ls
end

return { setup = setup }
