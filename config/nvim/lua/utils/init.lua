local M = {}

M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"bashls",
	"jsonls",
	"yamlls",
	"tailwindcss",
	"gopls",
	"astro",
	"jdtls",
	"pylsp",
	"clangd",
	"eslint",
}
M.lenguaje = {
 "bash",
      "blade",
      "css",
      "go",
      "gomod",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "nix",
      "org",
      "php",
      "phpdoc",
      "query",
      "rust",
      "sql",
      "svelte",
      "typescript",
      "regex",
      "vim",
      "yaml",
      "c",
      "jsdoc",
      "luap",
      "python",
      "tsx",
      "vimdoc"
} 


M.icons = {
	DEBUG = "",
	ERROR = "",
	INFO = "",
	TRACE = "✎",
	WARN = "",
}

M.linters = {
	"prettier",
	"stylua",
	"black",
}

M.parsers = {
	"lua",
	"vim",
	"markdown",
	"markdown_inline",
	"latex",
	"bash",
	"python",
	"cpp",
	"c",
	"java",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"json",
	"yaml",
	"toml",
	"regex",
	"go",
	"rust",
	"dockerfile",
}

function M.warn(msg, notify_opts)
	vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
	vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
	vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

return M
