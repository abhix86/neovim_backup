return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true, -- highlights Git status
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 200,
      },
      filters = {
        dotfiles = false,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
    })

    -- Toggle file explorer with Ctrl+n
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    -- Auto open nvim-tree when opening a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 1 then
          local arg = vim.fn.argv(0)
          if vim.fn.isdirectory(arg) == 1 then
            require("nvim-tree.api").tree.open()
          end
        end
      end
    })
  end
}
