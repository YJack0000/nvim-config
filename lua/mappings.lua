require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Normal mode
map("n", ";", ":", { desc = "Enter command mode", nowait = true })

-- Lazy
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazy Git" })
map("n", "<leader>ld", "<cmd>Lazydocker<CR>", { desc = "Lazy Docker" })

--Aerial
map("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Aerial Toggle" })
map("n", "{", "<cmd>AerialPrev<CR>", { desc = "Aerial Prev" })
map("n", "}", "<cmd>AerialNext<CR>", { desc = "Aerial Next" })
map("n", "<leader>fo", "<cmd>Telescope aerial<CR>", { desc = "Find Symbol" })

-- window management
map("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close Window" })

-- Buffer management
map("n", "<leader>bd", "<cmd>bufdo bd<CR>", { desc = "Close all buffers" })

-- Reopen last closed buffer
local last_closed_buffers = {}
local max_buffers = 10

local function save_last_closed_buffer(event)
    local bufnr = event.buf
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
        local buf_path = vim.api.nvim_buf_get_name(bufnr)
        -- 添加到 FILO 结构中
        table.insert(last_closed_buffers, buf_path)
        -- 如果记录超过 max_buffers，则删除最旧的记录
        if #last_closed_buffers > max_buffers then
            table.remove(last_closed_buffers, 1)
        end
        print("Saved last closed buffer path:", buf_path)
        print("Current buffer history:", vim.inspect(last_closed_buffers))
    else
        print("Buffer is not valid or not listed")
    end
end

local function reopen_last_closed_buffer()
    if #last_closed_buffers > 0 then
        local buf_path = table.remove(last_closed_buffers)
        if vim.fn.filereadable(buf_path) == 1 then
            -- Reopen the buffer from the saved path
            vim.cmd("e " .. buf_path)
            print("Reopened buffer from path:", buf_path)
        else
            print("Buffer file does not exist:", buf_path)
        end
    else
        print("No buffers to reopen")
    end
end

vim.api.nvim_create_autocmd("BufDelete", {
    callback = save_last_closed_buffer,
})

map("n", "<leader>bu", reopen_last_closed_buffer, { desc = "Reopen last closed buffer" })

-- Visual mode
map("v", ">", ">gv", { desc = "Indent" })

-- debugg
map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Continue" })

-- Trouble
-- map
map("n", "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

-- Noice
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Telescope (Notify)" })

-- NvimTree
-- Check if nvim-tree is focused
local function is_nvim_tree_focused()
	-- Get the name of the current buffer
	local bufname = vim.api.nvim_buf_get_name(0)
	-- Check if the buffer name matches "NvimTree_" which indicates that nvim-tree is focused
	return bufname:match("NvimTree_") ~= nil
end

-- Toggle or focus nvim-tree window
local function toggle_or_focus_nvim_tree()
	-- If nvim-tree is focused, then close it
	if is_nvim_tree_focused() then
		require("nvim-tree.api").tree.toggle({ find_file = true })
	else
		-- Otherwise, open or focus it
		require("nvim-tree.api").tree.open()
	end
end

-- 重新設置 <leader> + e 快捷鍵
map("n", "<leader>e", toggle_or_focus_nvim_tree, { noremap = true, silent = true })
