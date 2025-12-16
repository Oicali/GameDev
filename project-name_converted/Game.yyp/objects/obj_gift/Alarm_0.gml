/// @description respawn
// You can write your code in this editor

/// Respawn gift

show_debug_message("=== ALARM 0 TRIGGERED ===");

// Random position
x = irandom_range(50, room_width - 50);
y = irandom_range(50, room_height - 50);

// Make visible and reset collected flag
visible = true;
image_alpha = 1;
collected = false; // Allow collection again


audio_play_sound(snd_gift_spawn, 0, false);

show_debug_message("Gift respawned at X:" + string(x) + " Y:" + string(y));

























