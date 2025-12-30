// Don't respond if Settings menu is open
if (instance_exists(obj_settings_menu)) {
    exit;
}

// Don't respond if How to Play menu is open
if (instance_exists(obj_howtoplay_menu) && obj_howtoplay_menu.active) {
    exit;
}

// Don't respond if Credits menu is already open
if (instance_exists(obj_credits) && obj_credits.active) {
    exit;
}

// Check hover
hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);

// Open credits on click
if (hover && mouse_check_button_released(mb_left)) {
    with (obj_credits) {  // ← Changed from obj_button_credits to obj_credits!
        visible = true;
        active = true;
        current_page = 1;
    }
}

// Visual feedback
if (hover && mouse_check_button(mb_left)) {
    target_scale = 0.92;
} else if (hover) {
    target_scale = 1.08;
} else {
    target_scale = 1.0;
}

// Smooth scaling
current_scale = lerp(current_scale, target_scale, 0.2);