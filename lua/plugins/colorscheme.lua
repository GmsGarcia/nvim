return
  { "EdenEast/nightfox.nvim", 
  options = {
    -- Compiled file's destination location
    transparent = true,     -- Disable setting background
  },

  config = function()
 require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    transparent = true,     -- Disable setting background
  },
})

     vim.cmd.colorscheme "carbonfox"
    end
  }
