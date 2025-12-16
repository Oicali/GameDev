/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 36111FB3
/// @DnDArgument : "code" "/// @description initialize$(13_10)// You can write your code in this editor$(13_10)$(13_10)/// Initialize movement and sprites$(13_10)spd = 3;$(13_10)base_spd = 3;$(13_10)$(13_10)// Power-up variables$(13_10)is_stunned = false;$(13_10)effect_timer = 0;$(13_10)is_confused = false;$(13_10)confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];$(13_10)confusion_shuffled = false; // NEW: Track if we've shuffled$(13_10)$(13_10)// Start with idle down sprite$(13_10)sprite_index = spr_rat_idle_down;$(13_10)direction = 270;$(13_10)speed = 0;$(13_10)$(13_10)// this is edit$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)"
/// @description initialize
// You can write your code in this editor

/// Initialize movement and sprites
spd = 3;
base_spd = 3;

// Power-up variables
is_stunned = false;
effect_timer = 0;
is_confused = false;
confused_keys = [ord("W"), ord("S"), ord("A"), ord("D")];
confusion_shuffled = false; // NEW: Track if we've shuffled

// Start with idle down sprite
sprite_index = spr_rat_idle_down;
direction = 270;
speed = 0;

// this is edit