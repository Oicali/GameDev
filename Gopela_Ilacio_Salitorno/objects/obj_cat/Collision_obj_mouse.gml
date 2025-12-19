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
    audio_stop_all();
    show_debug_message("Cat Champion!");
    room_goto(Home);
    global.cat_score = 0;
    global.mouse_score = 0;
	global.round = 1;
}
else {
  
   
   other.x = 700; // set desired X coordinate
   other.y = 600; // set desired Y coordinate
	
	var rooms = [];
    if (room == Map1) {
        rooms = [Map2, Map3];
    } else if (room == Map2) {
        rooms = [Map1, Map3];
    } else if (room == Map3) {
        rooms = [Map2, Map1];
    }

    // Pick a random index
    var choice = irandom(array_length(rooms) - 1);

    // ===== Make both invisible and show "CAT WINS THIS ROUND" =====
	audio_stop_all()

	audio_play_sound(snd_win_round, 0, false)
	audio_play_sound(snd_cat_meow, 0, false)
    next_room = rooms[choice];       // store next room
    show_cat_winner = true;          // flag to draw message
    global.game_paused = true;       // pause controls + timer
    alarm[0] = room_speed * 5;       // after 3 seconds, Alarm[0] will fire
    show_debug_message("cat score: " + string(global.cat_score));
}
