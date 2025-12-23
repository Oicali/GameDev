/// @description Cat catches mouse

// PREVENT MULTIPLE COLLISIONS - Exit if already caught
if (global.game_paused) {
    exit;
}

// Increase cat score
global.cat_score += 1;
show_debug_message("Cat scored! Score: " + string(global.cat_score) + "/3");

// Store collision position (centered between cat and mouse)
var fight_x = (x + other.x) / 2;
var fight_y = (y + other.y) / 2;

// ===== COOL EFFECTS =====
// Screen shake
global.shake_magnitude = 8;   // Adjust intensity (8 is good, try 10-15 for stronger)
global.shake_duration = 30;   // Duration in frames (30 = 0.5 seconds at 60fps)

// Freeze frame for impact
global.freeze_frames = 10;    // Pause for 10 frames (feels punchy)

// Screen flash
global.flash_alpha = 0.6;     // Flash intensity (0 to 1)
global.flash_color = c_white; // Flash color (try c_red or c_yellow)

// Change cat sprite to fight cloud
sprite_index = spr_fight_cloud;
image_index = 0;
image_speed = 1;

// Position and size
x = fight_x - 34;
y = fight_y - 36;
image_xscale = 0.16;
image_yscale = 0.16;

// Hide/move mouse away
other.visible = false;
other.x = 700;
other.y = 600;

// Play fight cloud sound
audio_play_sound(snd_fight_cloud, 0, false);

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

// Pause game during fight cloud
global.game_paused = true;

// Check win condition
if (global.cat_score >= 3) {
    show_debug_message("Cat Champion!");
    show_champion_pending = true;
    alarm[1] = room_speed * 3;
}
else {
    // Calculate next room
    var rooms = [];
    if (room == Map1) {
        rooms = [Map2, Map3];
    } else if (room == Map2) {
        rooms = [Map1, Map3];
    } else if (room == Map3) {
        rooms = [Map2, Map1];
    }
    var choice = irandom(array_length(rooms) - 1);
    next_room = rooms[choice];
    
    show_banner_pending = true;
    alarm[1] = room_speed * 3;
}