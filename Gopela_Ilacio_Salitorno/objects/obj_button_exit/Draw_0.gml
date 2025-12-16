/// @description Insert description here
// You can write your code in this editor

var mouse_over = position_meeting(mouse_x, mouse_y, id);

if (mouse_over) {
    draw_sprite_ext(sprite_index, 0, x, y, 1.1, 1.1, 0, c_white, 1);
} else {
    draw_self();
}