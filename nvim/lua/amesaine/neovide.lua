if vim.g.neovide then
    vim.keymap.set("n", "<C-S-V>", [["+p]])

    vim.g.neovide_transparency = 0.8
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_scroll_animation_far_lines = 2

    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 15
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 65
    vim.g.neovide_refresh_rate = 75
    vim.g.neovide_refresh_rate_idle = 1

    vim.g.neovide_cursor_animation_length = 0.06
    vim.g.neovide_cursor_trail_size = 0.6
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false

    vim.g.neovide_cursor_vfx_mode = "ripple"
end
