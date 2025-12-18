/// @description Insert description here
// You can write your code in this editor

/// @description Initialize timer

time_remaining = 120; // 120 seconds later
alarm[0] = room_speed; // Countdown every second

// Position settings
timer_x = room_width / 2;
timer_y = 20;

// Spacing and size
spacing = 32;
number_scale = 1;

// Sound flag (prevents repeating sound)
warning_sound_played = false; // NEW: Add this line

