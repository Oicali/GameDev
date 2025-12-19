/// @description Insert description here
// You can write your code in this editor

randomize();

// Movement variables
spd = 1.8
base_spd = 1.8
hspd = 0;
vspd = 0;

// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [vk_up, vk_down, vk_left, vk_right]; // Arrow keys
confusion_shuffled = false;

// ROUND PAUSE VARIABLES
show_cat_winner = false;
show_cat_champion = false;

// Start with idle down sprite
sprite_index = spr_cat_idle_down;
direction = 270;
speed = 0;

image_xscale = 1.3
image_yscale = 1.3

// Ice physics variables (for Map3)
hsp = 0;  // Horizontal speed
vsp = 0;  // Vertical speed
friction_ice = 0.94;  // Higher = more slippery (0.85 = slides a lot, 0.5 = less slide)
ice_accel_multiplier = 0.07; 
ice_physics_active = true;  // Controls whether ice physics are on/off
/// @description Initialize
teleport_cooldown = 0;