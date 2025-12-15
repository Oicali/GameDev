/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 521B947D
/// @DnDArgument : "imageind_relative" "1"
/// @DnDArgument : "spriteind" "spr_rat_walk_down"
/// @DnDSaveInfo : "spriteind" "spr_rat_walk_down"
sprite_index = spr_rat_walk_down;
image_index += 0;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
/// @DnDVersion : 1.1
/// @DnDHash : 4211DDA3
/// @DnDArgument : "direction" "270"
direction = 270;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 60159C37
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1){	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 71FF7BCF
	/// @DnDParent : 60159C37
	/// @DnDArgument : "speed" "15"
	speed = 15;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3F13BF5F
else{	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 157B4EF0
	/// @DnDParent : 3F13BF5F
	/// @DnDArgument : "speed" "1.95"
	speed = 1.95;}