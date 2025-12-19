randomize();
// Movement variables
spd = 1.9
base_spd = 1.9
hspd = 0;
vspd = 0;
// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
confusion_shuffled = false;

show_mouse_champion = false

// Start with idle down sprite
show_mouse_winner = false
sprite_index = spr_rat_idle_down;
direction = 270;
speed = 0;

// Game variables - USE LOCAL AGAIN
cheese_collected = 0; // ADD THIS BACK

// Check if we teleported via gift
if (global.teleported_by_gift) {
    cheese_collected = global.mouse_cheese_collected; // Load saved cheese
    global.teleported_by_gift = false; // Reset flag
}

image_xscale = 0.8
image_yscale = 0.8
hsp = 0;
vsp = 0;
friction_ice = 0.94;
ice_accel_multiplier = 0.07;
ice_physics_active = true;
teleport_cooldown = 0;