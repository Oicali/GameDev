/// @description Insert description here
// You can write your code in this editor
/// @description Cat catches mouse

// Increase cat score
cat_score += 1;

show_debug_message("Cat scored! Score: " + string(cat_score) + "/3");

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
if (cat_score >= 3) {
    show_message("Cat Wins! Caught the mouse 3 times!");
    room_restart();
}
else {
    // Teleport both players to random spawn positions
    
    // Teleport mouse to one of two positions
    var mouse_spawns = [[20, 325], [20, 50]];
    var mouse_spawn = mouse_spawns[irandom(1)]; // Pick random spawn
    other.x = mouse_spawn[0];
    other.y = mouse_spawn[1];
    
    // Teleport cat to one of two positions
    var cat_spawns = [[580, 325], [580, 50]];
    var cat_spawn = cat_spawns[irandom(1)]; // Pick random spawn
    x = cat_spawn[0];
    y = cat_spawn[1];
    audio_play_sound(snd_catch, 0, false)
    show_debug_message("Players teleported! Cat: " + string(cat_score) + "/3");
}