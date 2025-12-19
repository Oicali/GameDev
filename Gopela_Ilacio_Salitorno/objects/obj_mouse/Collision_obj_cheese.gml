/// @description Collect Cheese
cheese_collected += 1; // CHANGED BACK TO LOCAL

audio_play_sound(snd_collect_cheese, 1, false);
instance_destroy(other);

if (cheese_collected >= 10) { // CHANGED BACK TO LOCAL
    global.mouse_score += 1;
    
    if (global.mouse_score >= 3) {
         // Move cat for next round
        obj_cat.x = 700;
        obj_cat.y = 600;
		
		 // Show the persistent banner and set position/scale
        obj_mouse_champion.visible = true;

		audio_stop_all();
		audio_play_sound(snd_victory, 0, false);
		// Pause and wait for key press (removed alarm)
		global.game_paused = true;
		show_mouse_champion = true;  // Flag for key detection

    } else {
        obj_cat.x = 700;
        obj_cat.y = 600;
        
        var rooms = [];
        if (room == Map1) {
            rooms = [Map2, Map3];
        } else if (room == Map2) {
            rooms = [Map1, Map3];
        } else if (room == Map3) {
            rooms = [Map2, Map1];
        }
        
        audio_stop_all();
        var choice = irandom(array_length(rooms) - 1);
        audio_play_sound(snd_win_round, 0, false);
        audio_play_sound(snd_mouse_squeak, 0, false);
        
		obj_mouse_banner.visible = true;
        // Set up the win display BEFORE any room changes
        next_room = rooms[choice];       // store next room
        global.game_paused = true;       // pause controls + timer
        alarm[1] = room_speed * 5;       // after 5 seconds, Alarm[1] will fire
        
        show_debug_message("mouse score: " + string(global.mouse_score));
    }
}

show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected)); // CHANGED BACK