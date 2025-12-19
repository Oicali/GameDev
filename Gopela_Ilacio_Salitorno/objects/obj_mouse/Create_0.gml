/// @description Insert description here
// You can write your code in this editor

randomize();


// Movement variables
spd = 2
base_spd = 2
hspd = 0;
vspd = 0;

// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
confusion_shuffled = false;

show_mouse_winner = false

// Start with idle down sprite
sprite_index = spr_rat_idle_down;
direction = 270;
speed = 0;

// Game variables
cheese_collected = 0;
image_xscale = 0.8
image_yscale = 0.8

// Ice physics variables (for Map3)
// Ice physics variables (for Map3)
hsp = 0;  // Horizontal speed
vsp = 0;  // Vertical speed
friction_ice = 0.94;  // Default friction
ice_accel_multiplier = 0.07;  // ADD THIS - default acceleration (matches your step event)// Higher = more slippery (adjust if needed)
ice_physics_active = true;  // Controls whether ice physics are on/off

teleport_cooldown = 0;

