/// @description Insert description here
// You can write your code in this editor

// Update frame to match digit value
image_index = digit_value;

// Change color if time is running out
var timer = instance_find(obj_timer_controller, 0);
if (instance_exists(timer)) {
    if (timer.time_remaining <= 10) {
        image_blend = c_red; // Red when 10 seconds left
        
        // Play sound only once when hitting 10 seconds
        if (timer.time_remaining == 10 && !timer.warning_sound_played) {
            audio_play_sound(snd_pick, 0, false);
            timer.warning_sound_played = true;
        }
    }
    else if (timer.time_remaining <= 30) {
        image_blend = c_yellow; // Yellow when 30 seconds left
    }
    else {
        image_blend = c_white; // Normal color
    }
}