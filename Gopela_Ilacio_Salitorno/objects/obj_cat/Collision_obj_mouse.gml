/// @description Cat catches mouse

// Increase cat score
global.cat_score += 1;

show_debug_message("Cat scored! Score: " + string(global.cat_score) + "/3");

// Remove all effects from MOUSE
other.effect_timer = 0;
other.spd = other.base_spd;
other.is_stunned = false;
other.is_confused = false;
other.confusion_shuffled = false;
other.confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
other.image_blend = c_white;

// Remove all effects from CAT
effect_timer = 0;
spd = base_spd;
is_stunned = false;
is_confused = false;
confusion_shuffled = false;
confused_keys = [vk_up, vk_down, vk_left, vk_right];
image_blend = c_white;

show_debug_message("All effects cleared from both players");

// Check win condition
if (global.cat_score >= 3) {
    audio_stop_all()
	show_debug_message("Cat Champion!");
    room_goto(Home);
	global.cat_score = 0;
	global.mouse_score = 0;
}
else {
    var rooms = []
		if(room==Map1){
			rooms = [Map2, Map3];
		} else if (room==Map2){
			rooms = [Map1, Map3];
		} else if (room==Map3){
			rooms = [Map2, Map1];
		}
		
		// Pick a random index
		var choice = irandom(array_length(rooms) - 1);
		room_goto(rooms[choice]);
		
		show_debug_message("cat score: " + string(global.cat_score));
}
