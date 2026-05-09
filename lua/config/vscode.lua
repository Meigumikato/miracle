if not vim.g.vscode then
  return
end

local vscode = require("vscode-neovim")
local map = vim.keymap.set

vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard
vim.g.mapleader = " "

local function action(cmd)
  return function()
    vscode.action(cmd)
  end
end

map("n", "H", action("workbench.action.previousEditorInGroup"), { desc = "Previous Editor" })
map("n", "L", action("workbench.action.nextEditorInGroup"), { desc = "Next Editor" })
map("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR><Esc>", { desc = "Clear Highlight" })
map("n", "gr", action("editor.action.goToReferences"), { desc = "Go To References" })
map("n", "gI", action("editor.action.goToImplementation"), { desc = "Go To Implementations" })
map("n", "<leader>cr", action("editor.action.rename"), { desc = "Lsp Rename" })
map("n", "<leader>cp", action("editor.action.peekDefinition"), { desc = "Lsp Peek" })
map("c", "<C-A>", "<C-B>", { desc = "Start Of Line" })
map("i", "<C-A>", "<Home>", { desc = "Start Of Line" })
map("i", "<C-E>", "<End>", { desc = "End Of Line" })
map("n", "m;", action("bookmarks.toggle"), { desc = "Toggle Bookmark" })
map("n", "m:", action("bookmarks.toggleLabeled"), { desc = "Toggle Bookmark Label" })
map("n", "m/", action("bookmarks.listFromAllFiles"), { desc = "List All Bookmarks" })
map("n", "]d", action("editor.action.marker.next"), { desc = "Next Diagnostic" })
map("n", "[d", action("editor.action.marker.prev"), { desc = "Prev Diagnostic" })
map("n", "]h", function()
  vscode.action("workbench.action.editor.nextChange")
  vscode.action("workbench.action.compareEditor.nextChange")
end, { desc = "Next Git Diff" })
map("n", "[h", function()
  vscode.action("workbench.action.editor.previousChange")
  vscode.action("workbench.action.compareEditor.previousChange")
end, { desc = "Prev Git Diff" })
