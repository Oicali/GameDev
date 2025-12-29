draw_set_color(c_white);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

var logo_x = 470;
var logo_y = 220;
var logo_scale = 0.3;

draw_sprite_ext(spr_logo, 0, logo_x, logo_y, logo_scale, logo_scale, 0, c_white, 1);

draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);