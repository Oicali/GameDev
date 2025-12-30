/// DRAW GUI EVENT - obj_ui_hud_complete
draw_set_alpha(0.8);

draw_sprite(spr_ui_hud_complete, 0, 0, 0);

draw_set_font(fnt_lilita_one);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
var mouse_score_text = string(global.mouse_score);
draw_text_transformed(70, 25, mouse_score_text, 0.6, 0.6, 0);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
var round_text = "ROUND " + string(global.round);
draw_text_transformed(display_get_gui_width() / 2, 25, round_text, 0.6, 0.6, 0);

draw_set_halign(fa_right);
draw_set_valign(fa_top);
var cat_score_text = string(global.cat_score);
draw_set_color(c_white);
draw_text_transformed(display_get_gui_width() - 70, 25, cat_score_text, 0.6, 0.6, 0);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
var cheese_text = "0/10";
if (instance_exists(obj_mouse)) {
    cheese_text = string(obj_mouse.cheese_collected) + "/10";
}
draw_set_color(c_white);
draw_text_transformed(70, display_get_gui_height() - 25, cheese_text, 0.6, 0.6, 0);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
var timer_text = "0:00";
if (instance_exists(obj_timer_controller)) {
    var minutes = floor(obj_timer_controller.time_left / 60);
    var seconds = floor(obj_timer_controller.time_left mod 60);
    var sec_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);
    timer_text = string(minutes) + ":" + sec_text;
}
draw_set_color(c_white);
draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() - 25, timer_text, 0.6, 0.6, 0);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
var status_text = "";
var status_color = c_white;

if (instance_exists(obj_cat)) {
    var cat = instance_find(obj_cat, 0);
    if (cat != noone && cat.effect_timer > 0) {
        var seconds_left = ceil(cat.effect_timer / room_speed);
        
        if (cat.spd > cat.base_spd) {
            status_text = "CAT: SPEED BOOST " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (cat.spd < cat.base_spd && !cat.is_stunned) {
            status_text = "CAT: SLOWED " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (cat.is_stunned) {
            status_text = "CAT: STUNNED " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (cat.is_confused) {
            status_text = "CAT: CONFUSED " + string(seconds_left) + "s";
            status_color = c_white;
        }
    }
}

if (status_text == "" && instance_exists(obj_mouse)) {
    var mouse = instance_find(obj_mouse, 0);
    if (mouse != noone && mouse.effect_timer > 0) {
        var seconds_left = ceil(mouse.effect_timer / room_speed);
        
        if (mouse.spd > mouse.base_spd) {
            status_text = "MOUSE: SPEED BOOST " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (mouse.spd < mouse.base_spd && !mouse.is_stunned) {
            status_text = "MOUSE: SLOWED " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (mouse.is_stunned) {
            status_text = "MOUSE: STUNNED " + string(seconds_left) + "s";
            status_color = c_white;
        }
        else if (mouse.is_confused) {
            status_text = "MOUSE: CONFUSED " + string(seconds_left) + "s";
            status_color = c_white;
        }
    }
}

draw_set_color(status_color);
draw_text_transformed(display_get_gui_width() - 70, display_get_gui_height() - 25, status_text, 0.6, 0.6, 0);

draw_set_alpha(1.0);