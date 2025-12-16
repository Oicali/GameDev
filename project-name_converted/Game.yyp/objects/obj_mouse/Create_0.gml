/// @description Insert description here
// You can write your code in this editor

randomize();

// Movement variables
spd = 3.2;
base_spd = 3.2;
hspd = 0;
vspd = 0;

// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
confusion_shuffled = false;

// Start with idle down sprite
sprite_index = spr_rat_idle_down;
direction = 270;
speed = 0;

// Game variables
cheese_collected = 0;

image_xscale = 0.7;
image_yscale = 0.7;








































































