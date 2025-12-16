/// @DnDAction : YoYo Games.Random.Get_Random_Number
/// @DnDVersion : 1
/// @DnDHash : 6923DB6F
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "type" "1"
/// @DnDArgument : "max" "2"
powerup = floor(random_range(0, 2 + 1));

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 34FE5246
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "1"
if(powerup == 1)
{
	/// @DnDAction : YoYo Games.Instances.Color_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 34C26C56
	/// @DnDParent : 34FE5246
	/// @DnDArgument : "colour" "$FFFFFF00"
	image_blend = $FFFFFF00 & $ffffff;
	image_alpha = ($FFFFFF00 >> 24) / $ff;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 28E4CC76
/// @DnDArgument : "var" "powerup"
/// @DnDArgument : "value" "2"
if(powerup == 2)
{
	/// @DnDAction : YoYo Games.Instances.Color_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 6FC1FB36
	/// @DnDParent : 28E4CC76
	/// @DnDArgument : "colour" "$FF0000FF"
	image_blend = $FF0000FF & $ffffff;
	image_alpha = ($FF0000FF >> 24) / $ff;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 16BF5595
else
{
	/// @DnDAction : YoYo Games.Instances.Color_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 69DB169C
	/// @DnDParent : 16BF5595
	/// @DnDArgument : "colour" "$FF00FF00"
	image_blend = $FF00FF00 & $ffffff;
	image_alpha = ($FF00FF00 >> 24) / $ff;
}

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 49CB48CC
/// @DnDArgument : "steps" "5*60"
alarm_set(0, 5*60);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 2F7A6D05
/// @DnDApplyTo : other
with(other) instance_destroy();