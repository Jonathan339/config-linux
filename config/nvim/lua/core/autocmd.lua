local agroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
  return agroup('lazyvim_' .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})

-- Auto format on save
autocmd('BufWritePost', {
  group = augroup('__formatter__'),
  command = ':FormatWrite',
})

-- Set custom highlights for completion menu
autocmd('TextChanged', {
  callback = function()
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
  end,
})

-- Remove trailing spaces before saving
autocmd('BufWritePre', {
  group = augroup('trim_trailing_spaces'),
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- Resize splits if window got resized
autocmd('VimResized', {
  group = augroup('resize_splits'),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- Highlight on yank
autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto create dir when saving a file
autocmd('BufWritePre', {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if not event.match:match('^%w%w+:[\\/][\\/]') then
      local file = vim.uv.fs_realpath(event.match) or event.match
      vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end
  end,
})

-- Close specific filetypes with <q>
autocmd('FileType', {
  group = augroup('close_with_q'),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'notify',
    'qf',
    'query',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Remove luasnip snippets when leaving insert mode
autocmd('InsertLeave', {
  callback = function()
    local luasnip = require('luasnip')
    if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
      luasnip.unlink_current()
    end
  end,
})

autocmd('BufReadPre', {
  group = augroup('large_file_optimizations'),
  callback = function()
    local max_size = 100 * 1024 -- 100 KB
    local file_size = vim.fn.getfsize(vim.fn.expand('<afile>'))
    if file_size > max_size then
      vim.cmd('syntax off')
      vim.cmd('setlocal noswapfile bufhidden=unload')
      vim.cmd('setlocal noundofile')
      vim.cmd('setlocal nofoldenable')
    end
  end,
})
