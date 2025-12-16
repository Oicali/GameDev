/// @description movement
// You can write your code in this editor

// Movement

// ===== EFFECT TIMER COUNTDOWN =====
if (effect_timer > 0) {
    effect_timer -= 1;
    
    if (effect_timer == 0) {
        spd = base_spd;
        is_stunned = false;
        is_confused = false;
        confused_keys = [vk_up, vk_down, vk_left, vk_right]; // reset
        confusion_shuffled = false; // NEW: Allow shuffle next time
        image_blend = c_white;
        show_debug_message("Effect ended - back to normal");
    }
}

// ===== CONFUSION SETUP (ONLY SHUFFLE ONCE) =====
if (is_confused && !confusion_shuffled) {
    confused_keys = [vk_up, vk_down, vk_left, vk_right];
    
    // Shuffle the array
    var n = array_length(confused_keys);
    for (var i = n - 1; i > 0; i--) {
        var j = irandom(i);
        var temp = confused_keys[i];
        confused_keys[i] = confused_keys[j];
        confused_keys[j] = temp;
    }
    
    confusion_shuffled = true; // Mark as shuffled
}

// ===== IF STUNNED, STOP ALL MOVEMENT =====
if (is_stunned) {
    speed = 0;
    
    if (direction == 90) sprite_index = spr_cat_idle_up;
    else if (direction == 270) sprite_index = spr_cat_idle_down;
    else if (direction == 180) sprite_index = spr_cat_idle_left;
    else if (direction == 0) sprite_index = spr_cat_idle_right;
    
    exit;
}

// ===== NORMAL MOVEMENT =====
speed = 0;

// Use confused mapping if active
var up_key    = is_confused ? confused_keys[0] : vk_up;
var down_key  = is_confused ? confused_keys[1] : vk_down;
var left_key  = is_confused ? confused_keys[2] : vk_left;
var right_key = is_confused ? confused_keys[3] : vk_right;

// UP (90 degrees)
if (keyboard_check(up_key)) {
    direction = 90;
    speed = spd;
    sprite_index = spr_cat_walk_up;
}
// DOWN (270 degrees)
else if (keyboard_check(down_key)) {
    direction = 270;
    speed = spd;
    sprite_index = spr_cat_walk_down;
}
// LEFT (180 degrees)
else if (keyboard_check(left_key)) {
    direction = 180;
    speed = spd;
    sprite_index = spr_cat_walk_left;
}
// RIGHT (0 degrees)
else if (keyboard_check(right_key)) {
    direction = 0;
    speed = spd;
    sprite_index = spr_cat_walk_right;
}
// Idle
else {
    if (direction == 90) sprite_index = spr_cat_idle_up;
    else if (direction == 270) sprite_index = spr_cat_idle_down;
    else if (direction == 180) sprite_index = spr_cat_idle_left;
    else if (direction == 0) sprite_index = spr_cat_idle_right;
}