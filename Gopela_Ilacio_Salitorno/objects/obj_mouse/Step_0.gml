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
    confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
    confusion_shuffled = false;
    image_blend = c_white;
    
    // Reset ice physics to default
   ice_physics_active = true;
    
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

// ===== GET TILEMAP FOR COLLISION =====
var _tilemap = layer_tilemap_get_id("Collision");
var _tilemap_tree = -1;
if (layer_exists("Tree_Collision")) {
    _tilemap_tree = layer_tilemap_get_id("Tree_Collision");
}

// ===== NORMAL MOVEMENT WITH COLLISION =====
speed = 0;

// Use confused mapping if active
var up_key    = is_confused ? confused_keys[0] : ord("W");
var down_key  = is_confused ? confused_keys[1] : ord("S");
var left_key  = is_confused ? confused_keys[2] : ord("A");
var right_key = is_confused ? confused_keys[3] : ord("D");

var move_x = 0;
var move_y = 0;
var moving = false;

// UP (90 degrees)
if (keyboard_check(up_key)) {
    direction = 90;
    move_y = -spd;
    sprite_index = spr_rat_walk_up;
    moving = true;
}
// DOWN (270 degrees)
else if (keyboard_check(down_key)) {
    direction = 270;
    move_y = spd;
    sprite_index = spr_rat_walk_down;
    moving = true;
}
// LEFT (180 degrees)
else if (keyboard_check(left_key)) {
    direction = 180;
    move_x = -spd;
    sprite_index = spr_rat_walk_left;
    moving = true;
}
// RIGHT (0 degrees)
else if (keyboard_check(right_key)) {
    direction = 0;
    move_x = spd;
    sprite_index = spr_rat_walk_right;
    moving = true;
}

// ===== APPLY MOVEMENT WITH COLLISION CHECK =====
// Check if we're in Map3 (slippery ice map)
// ===== APPLY MOVEMENT WITH COLLISION CHECK =====
// Check if we're in Map3 (slippery ice map)
// ===== APPLY MOVEMENT WITH COLLISION CHECK =====
// Check if ice physics should be active
var is_ice_map = (room == Map3);
var use_ice_physics = (is_ice_map && ice_physics_active);

if (moving) {
    if (use_ice_physics) {
        // ICE PHYSICS: Add acceleration instead of direct movement
        hsp += move_x * ice_accel_multiplier;
        vsp += move_y * ice_accel_multiplier;
    } else {
        // NORMAL: Direct movement
        hsp = move_x;
        vsp = move_y;
    }
}

// Apply friction
if (use_ice_physics) {
    // Ice: Always apply friction (slides after releasing keys!)
    hsp *= friction_ice;
    vsp *= friction_ice;
    
    // Stop completely if speed is very low
    if (abs(hsp) < 0.1) hsp = 0;
    if (abs(vsp) < 0.1) vsp = 0;
} else {
    // Normal map: stop immediately when no keys pressed
    if (!moving) {
        hsp = 0;
        vsp = 0;
    }
}

// Store old position
var old_x = x;
var old_y = y;

// Try to move using velocity
x += hsp;
y += vsp;

// Check collision
var collision_check = tilemap_get_at_pixel(_tilemap, x, y + 2);

// Only check tree collision if the layer exists
var tree_collision_check = 0;
if (_tilemap_tree != -1) {
    tree_collision_check = tilemap_get_at_pixel(_tilemap_tree, x, y);
}

// If colliding with rocks OR trees, undo movement and stop sliding
if (collision_check != 0 || tree_collision_check != 0) {
    x = old_x;
    y = old_y;
    hsp = 0;
    vsp = 0;
}

// ===== UPDATE DIRECTION BASED ON ACTUAL VELOCITY =====
// This fixes sprite animation - check actual movement, not just keys!
var actually_moving = (abs(hsp) > 0.1 || abs(vsp) > 0.1);

if (actually_moving) {
    // Determine direction based on velocity
    if (abs(vsp) > abs(hsp)) {
        // Moving more vertically
        if (vsp < 0) {
            direction = 90;
            sprite_index = spr_rat_walk_up;
        } else {
            direction = 270;
            sprite_index = spr_rat_walk_down;
        }
    } else {
        // Moving more horizontally
        if (hsp < 0) {
            direction = 180;
            sprite_index = spr_rat_walk_left;
        } else {
            direction = 0;
            sprite_index = spr_rat_walk_right;
        }
    }
}

// ===== IDLE ANIMATIONS =====
// Only show idle when NOT actually moving
if (!actually_moving) {
    if (direction == 90) sprite_index = spr_rat_idle_up;
    else if (direction == 270) sprite_index = spr_rat_idle_down;
    else if (direction == 180) sprite_index = spr_rat_idle_left;
    else if (direction == 0) sprite_index = spr_rat_idle_right;
}