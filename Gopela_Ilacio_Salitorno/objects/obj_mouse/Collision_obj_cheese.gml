/// @description Collect Cheese
// Increment cheese counter
cheese_collected += 1;

// Play sound effect (add your sound here)
audio_play_sound(snd_collect_cheese, 1, false);

// Destroy the cheese
instance_destroy(other);

// Check win condition
if (cheese_collected >= 10) {
    // Stop timer
    with (obj_timer_controller) {
        alarm[0] = -1; // Stop countdown
    }
    
    show_message("Mouse Wins! All cheese collected!");
    room_restart();
}

// Optional: Show debug message
show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected));