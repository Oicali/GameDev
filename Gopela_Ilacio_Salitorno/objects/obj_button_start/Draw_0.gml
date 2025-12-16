/// @description Insert description here
// You can write your code in this editor

// Check if mouse is hovering over button
var mouse_over = position_meeting(mouse_x, mouse_y, id);

// Draw button with hover effect
if (mouse_over) {
    // Make button slightly bigger and brighter when hovering
    draw_sprite_ext(sprite_index, 0, x, y, 1.1, 1.1, 0, c_white, 1);
} else {
    // Draw normal
    draw_self();
}