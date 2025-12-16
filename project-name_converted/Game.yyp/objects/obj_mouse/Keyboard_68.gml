/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 31C80307
/// @DnDArgument : "imageind_relative" "1"
/// @DnDArgument : "spriteind" "spr_rat_walk_right"
/// @DnDSaveInfo : "spriteind" "spr_rat_walk_right"
sprite_index = spr_rat_walk_right;
image_index += 0;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
/// @DnDVersion : 1.1
/// @DnDHash : 71CC1F36
/// @DnDArgument : "direction" "0"
direction = 0;

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 623F4D25
/// @DnDArgument : "speed" "5"
speed = 5;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 1991CD10
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1B94EBE4
	/// @DnDParent : 1991CD10
	/// @DnDArgument : "speed" "15"
	speed = 15;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 61E034A4
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 26E4A1E7
	/// @DnDParent : 61E034A4
	/// @DnDArgument : "speed" "5"
	speed = 5;
}