/// @description Insert description here
// You can write your code in this editor


digit_value = 0;
sprite_index = spr_numbers; // Single sprite with all numbers
image_index = digit_value; // Set frame based on digit
image_speed = 0; // Don't animate
depth = -1000;

/// @description Update sprite and color
switch(digit_value) {
    case 0: sprite_index = spr_number_0; break;
    case 1: sprite_index = spr_number_1; break;
    case 2: sprite_index = spr_number_2; break;
	case 3: sprite_index = spr_number_3; break;
	case 4: sprite_index = spr_number_4; break;
	case 5: sprite_index = spr_number_5; break;
	case 6: sprite_index = spr_number_6; break;
	case 7: sprite_index = spr_number_7; break;
	case 8: sprite_index = spr_number_8; break;
	case 9: sprite_index = spr_number_9; break;
}

// Change color if time is running out
var timer = instance_find(obj_timer_controller, 0);
if (instance_exists(timer)) {
    if (timer.time_remaining <= 10) {
        image_blend = c_red; // Red when 10 seconds left
		audio_play_sound(snd_pick, 0, false)
    }
    else if (timer.time_remaining <= 30) {
        image_blend = c_yellow; // Yellow when 30 seconds left
    }
    else {
        image_blend = c_white; // Normal color
    }
}