local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  require("completion").on_attach(client)
  vim.lsp.inlay_hint.enable(bufnr)
end
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "rust_analyzer",
          "clangd",
          "intelephense",
          "html",
          "cssls",
          "tsserver",
          "jsonls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local opt = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup(opt)
      lspconfig.gopls.setup(opt)
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })

      lspconfig.clangd.setup(opt) -- c & cpp

      -- gamedev
      --[[lspconfig.omnisharp.setup({
				cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
				on_attach = on_attach,
				capabilities = capabilities,
			})]]
      lspconfig.csharp_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- webdev
      lspconfig.intelephense.setup(opt) -- php
      lspconfig.html.setup(opt)      -- html
      lspconfig.cssls.setup(opt)     -- css
      lspconfig.tsserver.setup(opt)  -- js/ts
      lspconfig.jsonls.setup(opt)    -- json

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
