vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler on leave",
  group = vim.api.nvim_create_augroup("quit_autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable wrap and spell for text like documents",
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  desc = "Auto hide tabline",
  group = vim.api.nvim_create_augroup("autohide_tabline", { clear = true }),
  pattern = "AstroBufsUpdated",
  callback = function()
    local new_showtabline = #vim.t.bufs > 1 and 2 or 1
    if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
  end,
})
if vim.g.neovide then
  vim.o.guifont = "MesloLGS NF:h13:i:#e-subpixelantialias:#h-full"
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
