return {
  "andweeb/presence.nvim",
  config = function()
    local start_time = os.time()
    require("presence").setup({
      auto_update         = true,
      neovim_image_text   = "Neovim",
      main_image          = "file",
      client_id           = "793271441293967371",
      buttons = {
        {
          label = "View My GitHub",
          url = "https://youtu.be/dQw4w9WgXcQ?si=ix9smW_sQQoi2PDO",
        }
      },
      editing_text        = "Editing: %s",
      file_explorer_text  = "Browsing: %s",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Reading: %s",
      workspace_text = function(project_name, filename)
        if project_name and project_name ~= "" then
          return "Working on " .. project_name
        else
          local cwd = vim.fn.getcwd()
          local folder = vim.fn.fnamemodify(cwd, ":t")
          return "Workspace: " .. folder
        end
      end,
    })
  end
}


-- toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float", -- or "horizontal" if you prefer
      close_on_exit = true,
      shell = vim.o.shell or "powershell.exe", -- or use cmd.exe
    })
  end,
}



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
