var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Click slider
if (mouse_check_button_pressed(mb_left)) {
    if (point_distance(mx, my, slider_x, slider_y) < slider_radius) {
        dragging_slider = true;
    }
}

// Release slider
if (mouse_check_button_released(mb_left)) {
    dragging_slider = false;
}

// Drag slider
if (dragging_slider) {
    var relative_x = mx - bar_x;
    global.master_volume = clamp(relative_x / bar_width, 0, 1);
    slider_x = bar_x + (global.master_volume * bar_width);
    audio_master_gain(global.master_volume);
}

// Back button
back_btn_hover = (point_distance(mx, my, back_btn_x, back_btn_y) < 80);

if (back_btn_hover && mouse_check_button_released(mb_left)) {
    instance_destroy();
    instance_create_depth(0, 0, -9999, obj_pause_menu);
}

if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
    instance_create_depth(0, 0, -9999, obj_pause_menu);
}