// Only run if menu is active
if (!active) {
    // Reactivate all buttons when menu is closed
    instance_activate_object(obj_button_start);
    instance_activate_object(obj_button_howtoplay);
    instance_activate_object(obj_button_exit);
    exit;
}

// DEACTIVATE all home buttons while menu is open
instance_deactivate_object(obj_button_start);
instance_deactivate_object(obj_button_howtoplay);
instance_deactivate_object(obj_button_exit);

// Get mouse position
var mx = mouse_x;
var my = mouse_y;

// Reset hover state
mouse_over_button = "";

// LEFT ARROW
if (point_distance(mx, my, left_arrow_x, left_arrow_y) < left_arrow_radius) {
    mouse_over_button = "left";
    
    if (mouse_check_button_pressed(mb_left)) {
        current_page -= 1;
        if (current_page < 1) {
            current_page = total_pages;
        }
    }
}

// RIGHT ARROW
if (point_distance(mx, my, right_arrow_x, right_arrow_y) < right_arrow_radius) {
    mouse_over_button = "right";
    
    if (mouse_check_button_pressed(mb_left)) {
        current_page += 1;
        if (current_page > total_pages) {
            current_page = 1;
        }
    }
}

// BACK BUTTON
if (point_distance(mx, my, back_btn_x, back_btn_y) < back_btn_radius) {
    mouse_over_button = "back";
    
    if (mouse_check_button_pressed(mb_left)) {
        visible = false;
        active = false;
        current_page = 1;
        // Buttons will be reactivated at the top of this event on next frame
    }
}

// Keyboard navigation
if (keyboard_check_pressed(vk_left)) {
    current_page -= 1;
    if (current_page < 1) current_page = total_pages;
}
if (keyboard_check_pressed(vk_right)) {
    current_page += 1;
    if (current_page > total_pages) current_page = 1;
}
if (keyboard_check_pressed(vk_escape)) {
    visible = false;
    active = false;
    current_page = 1;
    // Buttons will be reactivated at the top of this event on next frame
}

// LEFT ARROW
if (point_distance(mx, my, left_arrow_x, left_arrow_y) < left_arrow_radius) {
    mouse_over_button = "left";
    
    if (mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_enter, 1, false); // ADD THIS
        current_page -= 1;
        if (current_page < 1) {
            current_page = total_pages;
        }
    }
}

// RIGHT ARROW
if (point_distance(mx, my, right_arrow_x, right_arrow_y) < right_arrow_radius) {
    mouse_over_button = "right";
    
    if (mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_enter, 1, false); // ADD THIS
        current_page += 1;
        if (current_page > total_pages) {
            current_page = 1;
        }
    }
}

// BACK BUTTON
if (point_distance(mx, my, back_btn_x, back_btn_y) < back_btn_radius) {
    mouse_over_button = "back";
    
    if (mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_enter, 1, false); // ADD THIS
        visible = false;
        active = false;
        current_page = 1;
    }
}