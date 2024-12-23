require("core")

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]
local utils = require("core.utils")

if custom_init_path then
	dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
	require("core.bootstrap").gen_chadrc_template()
	require("core.bootstrap").lazy(lazypath)
end

-- Rust setup
dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require("plugins")
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			-- vim.keymap.set("n", "<Leader>b", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

vim.cmd([[
function OpenMarkdownPreview (url)
  execute "silent ! google-chrome-stable --new-window --app=" . a:url
endfunction
]])
vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

require("custom.snippets")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.snippets",
	callback = function()
		vim.cmd("syntax off")
	end,
})

require("custom.figures")

vim.api.nvim_set_keymap(
	"n",
	"<C-f>",
	":lua require('custom.figures').create_figure()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-e>",
	":lua require('custom.figures').edit_figure()<CR>",
	{ noremap = true, silent = true }
)

require("git-conflict")

vim.diagnostic.config({
  virtual_text = false,  -- Отключаем текст ошибок
  signs = false,  -- Оставляем иконки (красный крестик)
  update_in_insert = true,
  underline = true,
  severity_sort = true,
})
