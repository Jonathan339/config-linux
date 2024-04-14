return {

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    
    local mason_tool_installer = require("mason-tool-installer")

    local opt = require("configs.lsp.default")
    local fidget = require("fidget")
    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status_ok then return end

    local settings = {
        ui = {
          border = "none",
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      }
      
    require("neodev").setup({})
  mason.setup(settings)
  
    mason-lspconfig.setup({
        --ensure_installed = servers,
    automatic_installation = true,
})


 
  
  local opts = {}
  
  for _, server in pairs(servers) do
    opts = {
      on_attach = require("lsp.handlers").on_attach,
      capabilities = require("lsp.handlers").capabilities,
    }
  
    server = vim.split(server, "@")[1]
  
    local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end
  
    lspconfig[server].setup(opts)
  end
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          on_attach = opt.lsp.on_attach,
          capabilities = opt.lsp.capabilities,
          flags = opt.lsp.flags,
        })
      end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      -- ["rust_analyzer"] = function ()
      --     require("rust-tools").setup {}
      -- end
    })

    mason_tool_installer.setup({
      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = opt.lsp.ensure_installed,
    })

    fidget.setup({})

}