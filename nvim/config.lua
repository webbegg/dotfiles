lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "catppuccin-macchiato"
-- lvim.colorscheme = "kanagawa"
lvim.builtin.bufferline.active = false
lvim.builtin.breadcrumbs.active = false
vim.cmd([[ set showtabline=0 ]])

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"

lvim.builtin.alpha.active = false
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_c = {
  components.filename,
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Plugins

lvim.plugins = {
  {
    "ellisonleao/gruvbox.nvim",
    "joshdick/onedark.vim",
    "chriskempson/base16-vim",
    "catppuccin/nvim",
    "rebelot/kanagawa.nvim",
    "navarasu/onedark.nvim",
    "ayu-theme/ayu-vim",
    "RRethy/nvim-base16"
  }
}
