// Pause check - ignore input when paused
if (global.game_paused) {
    exit;
}

// REST OF YOUR MOUSE MOVEMENT CODE BELOW THIS...

/// @description Movement with Collision
// ===== EFFECT TIMER COUNTDOWN =====
if (effect_timer > 0) {
    effect_timer -= 1;
    
    if (effect_timer == 0) {
        spd = base_spd;
        is_stunned = false;
        is_confused = false;
        confused_keys = [vk_up, vk_down, vk_left, vk_right];
        confusion_shuffled = false;
        image_blend = c_white;
        show_debug_message("Cat: Effect ended - back to normal");
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
    
    confusion_shuffled = true;
    show_debug_message("Cat keys shuffled!");
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

// ===== GET TILEMAP FOR COLLISION =====
var _tilemap = layer_tilemap_get_id("Collision");

// ===== NORMAL MOVEMENT WITH COLLISION =====
speed = 0;

// Use confused mapping if active
var up_key    = is_confused ? confused_keys[0] : vk_up;
var down_key  = is_confused ? confused_keys[1] : vk_down;
var left_key  = is_confused ? confused_keys[2] : vk_left;
var right_key = is_confused ? confused_keys[3] : vk_right;

var move_x = 0;
var move_y = 0;
var moving = false;

// UP (90 degrees)
if (keyboard_check(up_key)) {
    direction = 90;
    move_y = -spd;
    sprite_index = spr_cat_walk_up;
    moving = true;
}
// DOWN (270 degrees)
else if (keyboard_check(down_key)) {
    direction = 270;
    move_y = spd;
    sprite_index = spr_cat_walk_down;
    moving = true;
}
// LEFT (180 degrees)
else if (keyboard_check(left_key)) {
    direction = 180;
    move_x = -spd;
    sprite_index = spr_cat_walk_left;
    moving = true;
}
// RIGHT (0 degrees)
else if (keyboard_check(right_key)) {
    direction = 0;
    move_x = spd;
    sprite_index = spr_cat_walk_right;
    moving = true;
}

// ===== APPLY MOVEMENT WITH COLLISION CHECK =====
if (moving) {
    // Store old position
    var old_x = x;
    var old_y = y;
    
    // Try to move
    x += move_x;
    y += move_y;
    
    // Check collision slightly above center (adjust the -4 to make collision higher/lower)
    // -4 means check 4 pixels above center. Change this number to adjust height!
    var collision_check = tilemap_get_at_pixel(_tilemap, x, y + 7);
    
    // If colliding, undo movement
    if (collision_check != 0) {
        x = old_x;
        y = old_y;
    }
}
// ===== IDLE ANIMATIONS (THIS WAS MISSING!) =====
else {
    if (direction == 90) sprite_index = spr_cat_idle_up;
    else if (direction == 270) sprite_index = spr_cat_idle_down;
    else if (direction == 180) sprite_index = spr_cat_idle_left;
    else if (direction == 0) sprite_index = spr_cat_idle_right;
}