-- Setup of indent-blankline plugin

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup({
  -- There is a of configuration available. I'd like t add back the
  -- highlighting of the active block, but keeping it simple for now.
  --
  -- This prevents highlighting blocks that are not semantic in golang,
  -- but it includes the package as a block. Still figuring out how
  -- to get around that.
  use_treesitter = true,
})
