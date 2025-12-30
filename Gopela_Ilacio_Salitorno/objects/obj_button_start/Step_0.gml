//step code for obj_button_start
// CRITICAL: Check FIRST before doing ANYTHING
if (instance_exists(obj_settings_menu)) {
    hover = false;  // Reset hover
    exit;
}

if (instance_exists(obj_howtoplay_menu) && obj_howtoplay_menu.active) {
    hover = false;
    exit;
}

// Now check hover and clicks...
hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);

if (hover && mouse_check_button_released(mb_left)) {
    room_goto_next();
}

// ... rest of code

// Rest of code...
// Mouse hovering on button
hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);

// START GAME ON CLICK - THIS WAS MISSING!
if (hover && mouse_check_button_released(mb_left)) {
  room_goto(Map1); 
}

// Upscale when hover
if (hover && mouse_check_button(mb_left)) {
    target_scale = 0.92;  
} else if (hover) {
    target_scale = 1.08;  
} else {
    target_scale = 1.0;   
}

// Smooth scaling
current_scale = lerp(current_scale, target_scale, 0.2);