/// @description Insert description here
// You can write your code in this editor

/// @description Countdown timer

time_remaining -= 1;

show_debug_message("Time remaining: " + string(time_remaining));

// Check if time ran out
if (time_remaining <= 0) {
    show_message("Time's Up! Cat Wins!");
    room_restart();
}
else {
    // Continue countdown
    alarm[0] = room_speed; // Trigger again in 1 second
}