// Determine scale based on state
var draw_scale_x = image_xscale;
var draw_scale_y = image_yscale;

if (hover && mouse_check_button(mb_left)) {
    // Pressed - slightly smaller
    draw_scale_x *= 0.95;
    draw_scale_y *= 0.95;
} else if (hover) {
    // Hover - slightly bigger
    draw_scale_x *= 1.05;
    draw_scale_y *= 1.05;
}

// Draw shadow when hovering
if (hover) {
    draw_sprite_ext(sprite_index, 0, x + 4, y + 4, draw_scale_x, draw_scale_y, 0, c_black, 0.4);
}

// Draw the button
draw_sprite_ext(sprite_index, 0, x, y, draw_scale_x, draw_scale_y, 0, c_white, 1);

// Draw glow when hovering
if (hover) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, 0, x, y, draw_scale_x * 1.02, draw_scale_y * 1.02, 0, c_yellow, 0.3);
    gpu_set_blendmode(bm_normal);
}