-- Check if indent_blankline plugin installed
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
