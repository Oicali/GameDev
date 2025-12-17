/// @description Collect Cheese
// Increment cheese counter
cheese_collected += 1;

// Play sound effect (add your sound here)
audio_play_sound(snd_collect_cheese, 1, false);

// Destroy the cheese
instance_destroy(other);

// Optional: Show debug message
show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected));