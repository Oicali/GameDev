if (mode == "in") {
    // Fade in (black disappears)
    if (alpha > 0) {
        alpha -= fade_speed;
    } else {
        instance_destroy();
    }
}
else if (mode == "out") {
    // Fade out (screen goes black)
    if (alpha < 1) {
        alpha += fade_speed;
    } else {
        // Before changing room, set globals if this is a gift teleport
        if (is_gift_teleport) {
            global.teleported_by_gift = true;
            global.saved_timer = saved_timer_value;
            global.mouse_cheese_collected = saved_cheese_value;
            show_debug_message("Fade: Setting teleport flag + values before room change");
        }
        
        // Fade complete, change room
        if (target_room != -1) {
            room_goto(target_room);
        }
    }
}