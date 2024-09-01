return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  config = function()
    --local opt = require("configs.lsp.default")
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        'bash',
        'css',
        'go',
        'gomod',
        'html',
        'http',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'nix',
        'org',
        'php',
        'phpdoc',
        'python',
        'query',
        'regex',
        'rust',
        'sql',
        'svelte',
        'typescript',
        'vim',
        'yaml',
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
      auto_install = true,

      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { 'markdown' },
      },
    })

    local treesitter_parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    treesitter_parser_config.templ = {
      install_info = {
        url = 'https://github.com/vrischmann/tree-sitter-templ.git',
        files = { 'src/parser.c', 'src/scanner.c' },
        branch = 'master',
      },
    }
    context_commentstring = {
      enable = true,
      -- This plugin provided an autocommand option
      enable_autocmd = true,
    }
    vim.treesitter.language.register('templ', 'templ')
  end,
}