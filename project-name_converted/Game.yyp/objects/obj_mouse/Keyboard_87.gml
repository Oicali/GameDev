/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 015E0649
/// @DnDArgument : "imageind_relative" "1"
/// @DnDArgument : "spriteind" "spr_rat_walk_up"
/// @DnDSaveInfo : "spriteind" "spr_rat_walk_up"
sprite_index = spr_rat_walk_up;
image_index += 0;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
/// @DnDVersion : 1.1
/// @DnDHash : 34F19755
/// @DnDArgument : "direction" "90"
direction = 90;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 35D4CB5C
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1){	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 7DA96CCC
	/// @DnDParent : 35D4CB5C
	/// @DnDArgument : "speed" "15"
	speed = 15;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4F12A493
else{	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 12223C88
	/// @DnDParent : 4F12A493
	/// @DnDArgument : "speed" "1.95"
	speed = 1.95;}