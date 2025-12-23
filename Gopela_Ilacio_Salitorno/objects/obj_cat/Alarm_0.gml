/// ALARM[0] EVENT

/// @description Alarm[0] - Room transition

// NOW restore the cat sprite before changing rooms
sprite_index = original_sprite;
image_xscale = 1;  // Reset scale
image_yscale = 1;

// Hide banner
obj_cat_banner.visible = false;

show_cat_winner = false;
global.game_paused = false;   // resume controls + timer
global.round +=1 
room_goto(next_room);
