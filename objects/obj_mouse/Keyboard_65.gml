/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 6020D391
/// @DnDArgument : "imageind_relative" "1"
/// @DnDArgument : "spriteind" "spr_rat_walk_left"
/// @DnDSaveInfo : "spriteind" "spr_rat_walk_left"
sprite_index = spr_rat_walk_left;
image_index += 0;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
/// @DnDVersion : 1.1
/// @DnDHash : 3D68B72E
/// @DnDArgument : "direction" "180"
direction = 180;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0B0C4199
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 60D969E2
	/// @DnDParent : 0B0C4199
	/// @DnDArgument : "speed" "7"
	speed = 7;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 2887E895
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1931C8C1
	/// @DnDParent : 2887E895
	/// @DnDArgument : "speed" "5"
	speed = 5;
}