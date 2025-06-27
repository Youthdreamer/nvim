return {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- 延迟加载，在读取文件前触发
    opts = {
        dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
        need = 1,
        branch = true, -- use git branch to save session
    },
    keys = {
        -- 恢复 Session
        -- vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
        -- -- select a session to load
        -- vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
        -- -- 恢复上次 Session
        -- vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
        -- -- 不保存当前 Session	
        -- vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
    }
}
