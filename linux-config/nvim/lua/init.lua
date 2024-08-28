-- Lazy Vim Install 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy Package Manager
require("lazy").setup({
{
"nvim-treesitter/nvim-treesitter",
build = ":TSUpdate",
config = function ()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "typescript" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
end
},
{'folke/tokyonight.nvim'},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
{'nvim-telescope/telescope.nvim', tag = '0.1.6'},
{'nvim-lua/plenary.nvim'}
})

-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("lspconfig").tsserver.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").ccls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").pyright.setup({})

-- Autocomplete
local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    })
})

