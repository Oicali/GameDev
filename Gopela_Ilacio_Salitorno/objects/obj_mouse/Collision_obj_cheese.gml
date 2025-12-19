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
	room_restart();
	
	global.mouse_score +=1;

	if(global.mouse_score>=3){
		show_debug_message("Mouse Champion");
		audio_stop_all()
		room_goto(Home);
		global.mouse_score = 0;
		global.cat_score = 0;
	} else {
		
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
		
		show_debug_message("Mouse score: " + string(global.mouse_score));
	}
}

// Optional: Show debug message
show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected));