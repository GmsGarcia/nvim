local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("x", "p", "P")

-- Go to start-of-line/end-of-line
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")

-- Fix tab? (I forgot what is it for)
keymap.set("i", "<C-i>", "<C-i>")

-- Smart insert in blank line (auto indent)
keymap.set("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })

-- Mapping for dd that doesn't yank an empty line into your default register:
keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Toggle Linting
vim.keymap.set({ "n", "v" }, "<leader>lt", ":ToggleLinting<CR>", { desc = "Toggle linting" })
