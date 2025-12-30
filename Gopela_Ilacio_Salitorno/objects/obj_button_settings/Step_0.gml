// Step Codes for obj_button_settings

// Don't respond if Settings menu is open
if (instance_exists(obj_settings_menu)) {
    exit;
}

// Don't respond if How to Play menu is open
if (instance_exists(obj_howtoplay_menu) && obj_howtoplay_menu.active) {
    exit;
}



// Rest of code...

// Check hover
hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);

// Open settings menu on click
if (hover && mouse_check_button_released(mb_left)) {
    // Create settings menu
    if (!instance_exists(obj_settings_menu)) {
        var settings = instance_create_depth(0, 0, -10000, obj_settings_menu);
        settings.came_from_home = true; // Mark that it came from Home
    }
}

// Visual feedback
if (hover && mouse_check_button(mb_left)) {
    target_scale = 0.92; // Pressed - smaller
} else if (hover) {
    target_scale = 1.08; // Hover - bigger
} else {
    target_scale = 1.0; // Normal
}

// Smooth scaling
current_scale = lerp(current_scale, target_scale, 0.2);