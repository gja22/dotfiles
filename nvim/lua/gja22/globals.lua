-- Useful functions when writing plugins

-- Print the contents of a table
-- by default, print will just display the
-- memory address of a table
P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

-- Easy way to reload a lua function
R = function(name)
	RELOAD(name)
	return require(name)
end
