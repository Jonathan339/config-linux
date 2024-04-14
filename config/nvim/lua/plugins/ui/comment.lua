local M = {"numToStr/Comment.nvim",event = "VeryLazy",}

M.config = function()
    local Comment = require("Comment")
    Comment.setup()
end

return M
