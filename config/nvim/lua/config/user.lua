-- er.lua lua/config- DEFAULT USER SETTINGS
local ok, user_config = pcall(require, '')

if not ok then
  user_config = {}
end
local default_config = {
  border = 'rounded',
  disable_builtin_plugins = {},
  add_plugins = {},
  plugins = {
    lsp_lines = {
      -- additional flag only for CosmicNvim
      -- true - loads plugin and is enabled at start
      -- false - loads plugin but is not enabled at start
      -- you may use <leader>ld to toggle
      enable_on_start = false,
    },
  },
  lsp = {
    inlay_hint = true,
    format_on_save = true, -- true/false or table of filetypes {'.ts', '.js',}
    format_timeout = 500,
    rename_notification = true,
    on_attach = require('lsp.defaults').on_attach,
    -- table of callbacks pushed via plugins
    on_attach_mappings = {},
    -- lsp servers that should be installed
    ensure_installed = {
      -- 'codespell',

      -- 'djlint',
      'efm',
      -- 'elm_format',
      'emmet-ls',
      'eslint',
      -- 'gofumpt',
      'html',
      -- 'jdtls',
      'jq',
      'json-lsp',
      'jsonls',
      'lua_ls',
      'markdownlint',
      'prettier',
      'pyright',
      -- 'ruff_fix',
      -- 'ruff_format',
      'rust_analyzer',
      -- 'rustfmt',
      -- 'rustywind',
      'selene',
      'shellcheck',
      'shfmt',
      -- 'sql_formatter',
      'sqlls',
      'standardjs',
      'stylua',
      -- 'tailwindcss',
      'tailwindcss-language-server',
      'tsserver',
      'typescript-language-server',
      'vimls',
      'yamlls',
      -- 'zigfmt',
    },
    -- lsp servers that should be enabled
    servers = {
      astro = true,
      tailwindcss = true,
      eslint = true,
      jsonls = {
        format = false,
      },
      pyright = true,
      lua_ls = {
        format = false,
      },
      gopls = true,
      html = true,
      tsserver = {
        format = false,
      },
    },
  },
}

local u = require('utils')
local config = u.merge(default_config, user_config)
function config.lsp.add_on_attach_mapping(callback)
  table.insert(config.lsp.on_attach_mappings, callback)
end

return config