/// @description Initialize
// You can write your code in this editor

/// Initialize movement and sprites
spd = 3;
base_spd = 3;

// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [vk_up, vk_down, vk_left, vk_right];
confusion_shuffled = false; // NEW: Track if we've shuffled

// Start with idle down sprite
sprite_index = spr_cat_idle_down;
direction = 270;
speed = 0;






























