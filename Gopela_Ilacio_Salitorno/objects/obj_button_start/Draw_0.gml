// Draw shadow when hovering
if (hover) {
    draw_sprite_ext(sprite_index, 0, x + 3, y + 3, scale, scale, 0, c_black, 0.4);
}

// Draw the button
draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, c_white, 1);

// Draw glow when hovering
if (hover) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, 0, x, y, scale * 1.03, scale * 1.03, 0, c_yellow, 0.3);
    gpu_set_blendmode(bm_normal);
}