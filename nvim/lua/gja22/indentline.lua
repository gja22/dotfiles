-- Check if indent_blankline plugin installed
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
  char = '',
  -- char = '┊',
  context_char = '│',
  show_current_context = true,
  show_current_context_start = false,
  show_trailing_blankline_indent = false,
}
