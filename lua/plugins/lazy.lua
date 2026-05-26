vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.pack.add({"https://github.com/mason-org/mason.nvim"})
require("mason").setup()

vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons'
})
require ("nvim-web-devicons").setup()
require ("lualine").setup({
    options = {
theme = 'auto'
    }
})

vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
require("nvim-treesitter.config").setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
    highlight = { enable = true },
    indent = { enable = true }
}
require ("nvim-treesitter").install { "lua", "javascript", "python" }

vim.pack.add({"https://github.com/folke/tokyonight.nvim"})

vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})
require('gitsigns').setup {
    signs = {
add = { text = '+' },
change = { text = '~' },
delete = { text = '_' },
topdelete = { text = '‾' },
changedelete = { text = '~' },
    }
}

vim.pack.add({"https://github.com/mason-org/mason.nvim"})
require("mason").setup()

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
