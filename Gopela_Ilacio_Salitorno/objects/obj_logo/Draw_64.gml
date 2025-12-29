// ===== WHITE BACKGROUND =====
draw_set_color(c_white);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// ===== DRAW LOGO (always visible) =====
var logo_x = 470;
var logo_y = 220;
var logo_scale = 0.3;

draw_sprite_ext(
    spr_logo,
    0,
    logo_x,
    logo_y,
    logo_scale,
    logo_scale,
    0,
    c_white,
    1  // Logo stays solid
);

// ===== FADE OVERLAY (black rectangle on top) =====
draw_set_color(c_black);
draw_set_alpha(fade_alpha);  // This controls the fade
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);  // Reset alpha