local function setup()
  local cmp_loaded, cmp_capabilities = pcall(require, "cmp_nvim_lsp")
  local null_ls_loaded, null_ls = pcall(require, "null-ls")
  local lsp_loaded, lspconfig = pcall(require, "lspconfig")

  if not cmp_loaded and null_ls_loaded and lsp_loaded then
    return
  end

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
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = {
          globals = { "vim", "require" },
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "10",
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    },
  }) -- lua

  lspconfig.ruby_ls.setup({})
  lspconfig.eslint.setup({})
  lspconfig.gopls.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  }) -- json
  lspconfig.intelephense.setup({})

  null_ls.setup({
    sources = {
      -- JS/TS
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.eslint_d,
      -- Rust
      null_ls.builtins.formatting.rustfmt,
      -- Go
      null_ls.builtins.formatting.gofmt,
      -- Lua
      null_ls.builtins.formatting.stylua,
      -- Ruby
      null_ls.builtins.formatting.standardrb,
      -- PHP
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.diagnostics.phpcs,
      null_ls.builtins.diagnostics.phpstan,
    },
    on_attach = function(client, bufnr)
      format_on_save(client, bufnr)
    end,
  }) -- null_ls
end

return { setup = setup }
