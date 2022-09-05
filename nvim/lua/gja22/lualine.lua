local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local filetype = {
  "filetype",
  icons_enabled = false,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "filename",
                    file_status = true,
                    path = 1 -- 0=filename, 1=rel path, 2=abs path
                  }
                },
    lualine_x = { "diff", "encoding", filetype },
    lualine_y = { { "location", padding = 0 } },
    lualine_z = { "progress" },
  },
  -- tabline = {
  -- lualine_a = {{'buffers', mode = 0 }},
  -- lualine_b = {},
  -- lualine_c = {},
  -- lualine_x = {},
  -- lualine_y = {},
  -- lualine_z = {}
  -- },
}
