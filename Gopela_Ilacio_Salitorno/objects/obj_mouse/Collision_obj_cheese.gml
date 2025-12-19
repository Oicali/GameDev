/// @description Collect Cheese
cheese_collected += 1; // CHANGED BACK TO LOCAL

audio_play_sound(snd_collect_cheese, 1, false);
instance_destroy(other);

if (cheese_collected >= 10) { // CHANGED BACK TO LOCAL
    global.mouse_score += 1;
    
    if (global.mouse_score >= 3) {
        show_debug_message("Mouse Champion");
        audio_stop_all();
        room_goto(Home);
        global.mouse_score = 0;
        global.cat_score = 0;
        global.round = 1;
        // Don't need to reset cheese - it resets automatically
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
        
        next_room = rooms[choice];
        show_mouse_winner = true;
        global.game_paused = true;
        alarm[1] = room_speed * 5;
        
        // Cheese resets automatically when room changes (Create event sets it to 0)
        
        show_debug_message("mouse score: " + string(global.mouse_score));
    }
}

show_debug_message("Mouse collected cheese! Total: " + string(cheese_collected)); // CHANGED BACK