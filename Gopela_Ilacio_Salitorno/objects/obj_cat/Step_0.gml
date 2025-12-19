// Pause check - ignore input when paused
// ===== CHECK FOR KEY PRESS TO GO HOME AFTER CHAMPION WIN =====
if (show_cat_champion) {
    // Initialize wait timer if it doesn't exist
    if (!variable_instance_exists(id, "champion_wait_timer")) {
        champion_wait_timer = room_speed * 3; // 3 seconds
    }
    
    // Countdown the timer
    if (champion_wait_timer > 0) {
        champion_wait_timer -= 1;
    }
    
    // Only allow key press after timer reaches 0
    if (champion_wait_timer <= 0 && keyboard_check_pressed(vk_anykey)) {
        show_cat_champion = false;
        champion_wait_timer = 0; // Reset for next time
        
        if (instance_exists(obj_cat_banner)) {
            obj_cat_banner.visible = false;
        }
        
        global.game_paused = false;
        audio_stop_all();
        audio_play_sound(snd_hover, 0, false);
        room_goto(Home);
        global.cat_score = 0;
        global.mouse_score = 0;
        global.round = 1;
    }
    exit; // Don't process any other input while waiting for key press
}


if (global.game_paused) {
    exit;
}


// ===== DISABLE MOVEMENT DURING COUNTDOWN ===== 
if (instance_exists(obj_timer_controller)) { 
	if (obj_timer_controller.state == "countdown") { 
		// Force idle sprite while waiting 
		if (direction == 90) sprite_index = spr_cat_idle_up; 
		else if (direction == 270) sprite_index = spr_cat_idle_down; 
		else if (direction == 180) sprite_index = spr_cat_idle_left; 
		else if (direction == 0) sprite_index = spr_cat_idle_right; exit; 
	} 
}

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
    
   ice_physics_active = true;
    
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
var _tilemap_tree = -1;
if (layer_exists("Tree_Collision")) {
    _tilemap_tree = layer_tilemap_get_id("Tree_Collision");
}

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
var old_x = x;
var old_y = y;

// Try to move using velocity
x += hsp;
y += vsp;

// Check collision
var collision_check = tilemap_get_at_pixel(_tilemap, x, y + 10);

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
            sprite_index = spr_cat_walk_up;  // Change to spr_cat_walk_up for cat
        } else {
            direction = 270;
            sprite_index = spr_cat_walk_down;  // Change to spr_cat_walk_down for cat
        }
    } else {
        // Moving more horizontally
        if (hsp < 0) {
            direction = 180;
            sprite_index = spr_cat_walk_left;  // Change to spr_cat_walk_left for cat
        } else {
            direction = 0;
            sprite_index = spr_cat_walk_right;  // Change to spr_cat_walk_right for cat
        }
    }
}

// ===== IDLE ANIMATIONS (THIS WAS MISSING!) =====
// ===== IDLE ANIMATIONS =====
// Only show idle when NOT actually moving
if (!actually_moving) {
    if (direction == 90) sprite_index = spr_cat_idle_up;  // Change to spr_cat for cat
    else if (direction == 270) sprite_index = spr_cat_idle_down;
    else if (direction == 180) sprite_index = spr_cat_idle_left;
    else if (direction == 0) sprite_index = spr_cat_idle_right;
}

/// @description Cooldown timer
if (teleport_cooldown > 0) {
    teleport_cooldown--;
}

/// @description Step Event (add this to existing code)

/// @description Step Event - Speed recovery when not in quicksand

// Check if obj_quicksand exists before checking collision
/// @description Step Event - Speed recovery when not in quicksand

// Check if obj_quicksand exists before checking collision
/// @description Step Event - Speed recovery when not in quicksand

/// @description Step Event - Speed recovery when not in quicksand

// Check if obj_quicksand exists before checking collision
if (object_exists(obj_quicksand)) {
    // If NOT touching quicksand, restore normal speed
    if (!place_meeting(x, y, obj_quicksand)) {
        // Only restore speed if there's NO active gift effect
        if (effect_timer <= 0) {
            // Return to normal speed immediately
            spd = base_spd;
            
            // Reset color
            image_blend = c_white;
        }
        
        // Stop the quicksand sound immediately
        if (audio_is_playing(snd_quicksandsfx)) {
            audio_stop_sound(snd_quicksandsfx);
        }
        
        // Destroy the slow indicator
        if (variable_instance_exists(id, "quicksand_indicator") && instance_exists(quicksand_indicator)) {
            instance_destroy(quicksand_indicator);
            quicksand_indicator = noone;
        }
    }
} else {
    // If obj_quicksand doesn't exist, make sure speed is normal
    // BUT only if no gift effect is active
    if (spd < base_spd && effect_timer <= 0) {
        spd = base_spd;
    }
}
