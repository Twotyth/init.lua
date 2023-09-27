local trouble = require('trouble')

vim.keymap.set("n", "rr", function () trouble.open('lsp_references') end,
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>wd", function () trouble.open('workspace_diagnostics') end,
  {silent = true, noremap = true}
)
