return {
  "vimwiki/vimwiki",
  config = function()
    vim.g.vimwiki_list = {
      { path = "~/notes", syntax = "markdown", ext = ".md", links_space_char = "-" },
    }
    vim.g.vimwiki_ext2syntax = { [".md"] = "markdown", [".markdown"] = "markdown", [".mdown"] = "markdown" }
    vim.g.vimwiki_use_mouse = 1
    vim.g.vimwiki_markdown_link_ext = 1

    vim.keymap.set("n", "<leader>ww", "<cmd>VimwikiIndex 1<CR>")
    vim.keymap.set("n", "<leader>we", "<cmd>VimwikiIndex<CR>")
  end,
}
