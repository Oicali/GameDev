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
/// @DnDHash : 59011546
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 11796619
	/// @DnDParent : 59011546
	/// @DnDArgument : "speed" "7"
	speed = 7;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 0B200053
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 71FF7BCF
	/// @DnDParent : 0B200053
	/// @DnDArgument : "speed" "5"
	speed = 5;
}