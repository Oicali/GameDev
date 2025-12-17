// Check if mouse is hovering over button
hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);

// Update target scale based on state
if (hover && mouse_check_button(mb_left)) {
    target_scale = 0.92;  // Pressed - smaller
	
} else if (hover) {
    target_scale = 1.08;  // Hover - bigger
	
} else {
    target_scale = 1.0;   // Normal
}