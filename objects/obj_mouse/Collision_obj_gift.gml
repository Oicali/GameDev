/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2019235E
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "var" "powerup"
powerup = 1;

/// @DnDAction : YoYo Games.Instances.Color_Sprite
/// @DnDVersion : 1
/// @DnDHash : 34C26C56
/// @DnDArgument : "colour" "$FFFFFF00"
image_blend = $FFFFFF00 & $ffffff;
image_alpha = ($FFFFFF00 >> 24) / $ff;

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