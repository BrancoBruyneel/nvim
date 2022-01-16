local utils = require "core.utils"

local map = utils.map

local cmd = vim.cmd

local M = {}

M.general = function()
  -- move lines
  map("v", "J", ":m '>+1<CR>gv=gv")
  map("v", "K", ":m '<-2<CR>gv=gv")

  -- clipboard
  map("n", "<leader>y", '"+y')
  map("v", "<leader>y", '"+y')
  map("n", "<C-a>", ":%y+ <CR>")
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>")

 -- close  buffer
  map("n", "<leader>x", ":lua require('core.utils').close_buffer() <CR>")
end

M.packer = function()
  -- Add Packer commands because we are not loading it at startup
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

end

M.nvimtree = function()
  map("n", "<leader>ne", ":NvimTreeToggle <CR>")
  map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.telescope = function()
  map("n", "<leader>fb", ":Telescope buffers <CR>")
  map("n", "<C-p>",      ":Telescope find_files <CR>")
  map("n", "<leader>cm", ":Telescope git_commits <CR>")
  map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
  map("n", "<leader>fh", ":Telescope help_tags <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")
  map("n", "<leader>fo", ":Telescope oldfiles <CR>")
  map("n", "<leader>th", ":Telescope themes <CR>")
end

M.telescope_media = function()
  map("n", "<leader>fp", ":Telescope media_files <CR>")
end

return M