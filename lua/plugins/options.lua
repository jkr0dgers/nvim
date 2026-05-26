vim.cmd("colorscheme tokyonight-night")
--require("bufferline").setup{}

vim.diagnostic.config({
  underline = { severity = { min = vim.diagnostic.severity.ERROR } },
})
