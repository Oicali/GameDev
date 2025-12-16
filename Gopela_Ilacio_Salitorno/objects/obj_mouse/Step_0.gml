/// @description Insert description here
// You can write your code in this editor


// ===== EFFECT TIMER COUNTDOWN =====
if (effect_timer > 0) {
    effect_timer -= 1;
    
    if (effect_timer == 0) {
        spd = base_spd;
        is_stunned = false;
        is_confused = false;
        confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
        confusion_shuffled = false;
        image_blend = c_white;
        show_debug_message("Mouse: Effect ended - back to normal");
    }
}

// ===== CONFUSION SETUP (ONLY SHUFFLE ONCE) =====
if (is_confused && !confusion_shuffled) {
    confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
    
    // Shuffle the array
    var n = array_length(confused_keys);
    for (var i = n - 1; i > 0; i--) {
        var j = irandom(i);
        var temp = confused_keys[i];
        confused_keys[i] = confused_keys[j];
        confused_keys[j] = temp;
    }
    
    confusion_shuffled = true;
    show_debug_message("Mouse keys shuffled!");
}

// ===== IF STUNNED, STOP ALL MOVEMENT =====
if (is_stunned) {
    speed = 0;
    
    if (direction == 90) sprite_index = spr_rat_idle_up;
    else if (direction == 270) sprite_index = spr_rat_idle_down;
    else if (direction == 180) sprite_index = spr_rat_idle_left;
    else if (direction == 0) sprite_index = spr_rat_idle_right;
    
    exit;
}

// ===== NORMAL MOVEMENT =====
speed = 0;

// Use confused mapping if active
var up_key    = is_confused ? confused_keys[0] : ord("W");
var down_key  = is_confused ? confused_keys[1] : ord("S");
var left_key  = is_confused ? confused_keys[2] : ord("A");
var right_key = is_confused ? confused_keys[3] : ord("D");

// UP (90 degrees)
if (keyboard_check(up_key)) {
    direction = 90;
    speed = spd;
    sprite_index = spr_rat_walk_up;
}
// DOWN (270 degrees)
else if (keyboard_check(down_key)) {
    direction = 270;
    speed = spd;
    sprite_index = spr_rat_walk_down;
}
// LEFT (180 degrees)
else if (keyboard_check(left_key)) {
    direction = 180;
    speed = spd;
    sprite_index = spr_rat_walk_left;
}
// RIGHT (0 degrees)
else if (keyboard_check(right_key)) {
    direction = 0;
    speed = spd;
    sprite_index = spr_rat_walk_right;
}
// Idle
else {
    if (direction == 90) sprite_index = spr_rat_idle_up;
    else if (direction == 270) sprite_index = spr_rat_idle_down;
    else if (direction == 180) sprite_index = spr_rat_idle_left;
    else if (direction == 0) sprite_index = spr_rat_idle_right;
}








































































