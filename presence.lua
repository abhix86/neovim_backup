return {
  "andweeb/presence.nvim",
  config = function()
    local start_time = os.time()
    require("presence").setup({
      neovim_image_text   = "Neovim",
      main_image          = "file",
      client_id           = "793271441293967371",
      buttons = {
        {
          label = "View My GitHub",
          url = "https://youtu.be/dQw4w9WgXcQ?si=ix9smW_sQQoi2PDO",
        }
      },
      editing_text        = nil,
      workspace_text = "Editing: %s",
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
