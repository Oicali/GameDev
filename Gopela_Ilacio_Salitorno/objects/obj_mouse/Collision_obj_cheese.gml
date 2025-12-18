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
	// Create an array of your rooms
	//var rooms = [Map1, Map2, Map3];

	// Pick a random index
	//var choice = irandom(array_length(rooms) - 1);

	// Go to that room
	//room_goto(rooms[choice]);
	
	if(room==Map1){
		room_goto(Map2);
	} else if (room==Map2){
		room_goto(Map3);
	} 
}

// Optional: Show debug message
show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected));