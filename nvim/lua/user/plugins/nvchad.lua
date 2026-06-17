vim.g.base46_cache = vim.fn.stdpath("cache") .. "/base46/"

local ok_base46, base46 = pcall(require, "base46")
if ok_base46 and type(base46) == "table" and type(base46.compile) == "function" then
	if vim.fn.isdirectory(vim.g.base46_cache) == 0 then
		pcall(base46.compile)
	end
end
