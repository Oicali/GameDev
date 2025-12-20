/// @description Fade transition

if (mode == "out") {
    // Fade out (screen goes black)
    if (alpha < 1) {
        alpha += fade_speed;
    } else {
        // Fade complete, change room
        if (target_room != -1) {
            show_debug_message("=== CHANGING ROOM - Flag is: " + string(global.teleported_by_gift) + " ===");
            room_goto(target_room);
            mode = "in";  // Switch to fade in after room change
        }
    }
}
else if (mode == "in") {
    // Fade in (black disappears)
    if (alpha > 0) {
        alpha -= fade_speed;
    } else {
        // Fade complete - RESET FLAGS NOW
        show_debug_message("=== BEFORE RESET - Flag: " + string(global.teleported_by_gift) + ", Timer: " + string(global.saved_timer) + ", Cheese: " + string(global.mouse_cheese_collected) + " ===");
        
        if (global.teleported_by_gift) {
            global.teleported_by_gift = false;
            global.saved_timer = 81;
            show_debug_message("=== FADE COMPLETE - FLAGS RESET ===");
        }
        
        instance_destroy();
    }
}