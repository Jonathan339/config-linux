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



M.lsp_signs = { Error = "✖ ", Warn = "! ", Hint = "󰌶 ", Info = " " }

M.lsp_kinds = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Copilot = " ",
	Namespace = " ",
	Package = " ",
	String = " ",
	Number = " ",
	Boolean = " ",
	Array = " ",
	Object = " ",
	Key = " ",
	Null = " ",
}

M.mason_packages = {
	"bash-language-server",
	"black",
	"clang-format",
	"clangd",
	"codelldb",
	"cspell",
	"css-lsp",
	"eslint-lsp",
	"graphql-language-service-cli",
	"html-lsp",
	"json-lsp",
	"lua-language-server",
	"markdownlint",
	"prettier",
	"pyright",
	"shfmt",
	"tailwindcss-language-server",
	"taplo",
	"typescript-language-server",
	"yaml-language-server",
	"gopls",
	"editorconfig-checker",
}

M.lsp_servers = {
	"clangd",
	"tsserver",
	"pyright",
	"lua_ls",
	"eslint",
	"bashls",
	"yamlls",
	"jsonls",
	"cssls",
	"taplo",
	"html",
	"graphql",
	"tailwindcss",
	"gopls",
}

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end


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
