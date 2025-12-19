show_debug_message("=== TIMER CREATE EVENT ===");
show_debug_message("Saved timer value: " + string(global.saved_timer));

// Initialize these FIRST (before the if/else)
show_room_refresh = false; // ← MAKE SURE THIS IS HERE!
loop_count = 0;
timer_done = false;

// CHECK IF SAVED TIMER IS DIFFERENT FROM DEFAULT (means we teleported!)
if (global.saved_timer != 81 && global.saved_timer > 0) {
    state = "active";
    countdown_time = 0;
    countdown_done = true;
    time_left = global.saved_timer;
    show_debug_message("TELEPORTED! Timer set to: " + string(time_left) + " - NO COUNTDOWN");
    
    global.saved_timer = 81;
} else {
    state = "countdown";
    countdown_time = 4;
    countdown_done = false;
    time_left = 81;
    show_debug_message("NORMAL START! Timer set to: " + string(time_left) + " - WITH COUNTDOWN");
}