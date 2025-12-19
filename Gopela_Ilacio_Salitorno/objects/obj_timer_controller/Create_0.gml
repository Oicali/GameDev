show_debug_message("=== TIMER CREATE EVENT ===");
show_debug_message("Saved timer value: " + string(global.saved_timer));

// Round states
// CHECK IF SAVED TIMER IS DIFFERENT FROM DEFAULT (means we teleported!)
if (global.saved_timer != 81 && global.saved_timer > 0) {
    state = "active"; // SKIP COUNTDOWN
    countdown_time = 0;
    countdown_done = true;
    time_left = global.saved_timer; // Restore saved time
    show_debug_message("TELEPORTED! Timer set to: " + string(time_left) + " - NO COUNTDOWN");
    
    // Reset saved timer back to default
    global.saved_timer = 81;
} else {
    state = "countdown"; // Normal start
    countdown_time = 4;
    countdown_done = false;
    time_left = 81;
    show_debug_message("NORMAL START! Timer set to: " + string(time_left) + " - WITH COUNTDOWN");
}

show_room_refresh = false;
loop_count = 0;
timer_done = false;