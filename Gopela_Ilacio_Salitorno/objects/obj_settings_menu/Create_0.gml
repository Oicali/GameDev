// Make sure we're in a game room
if (room == Home) {
    instance_destroy();
    exit;
}

depth = -10000;

// Volume
if (!variable_global_exists("master_volume")) {
    global.master_volume = 1.0;
}

dragging_slider = false;

// UI positions
container_x = display_get_gui_width() / 2;
container_y = display_get_gui_height() / 2;

// Volume bar
bar_x = container_x - 200;
bar_y = container_y - 20;
bar_width = 400;
bar_height = 40;

// Slider
slider_x = bar_x + (global.master_volume * bar_width);
slider_y = bar_y + (bar_height / 2);
slider_radius = 25;

// Back button
back_btn_x = container_x;
back_btn_y = container_y + 120;
back_btn_hover = false;

// NEW CODE - ADD THESE LINES:
// Calculate minimum slider position (after the icon)
var icon_right_edge = (container_x - 218) + 40; // Icon center + icon radius
slider_min_x = icon_right_edge + 1; // Add 10px padding


// Then when you calculate bar_left or slider range:
bar_left = slider_min_x;  // Start slider track here instead
bar_right = container_x + 230; // Keep your existing right edge
bar_width = bar_right - bar_left;

