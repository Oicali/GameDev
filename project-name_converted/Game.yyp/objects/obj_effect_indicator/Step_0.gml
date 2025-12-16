/// @description Insert description here
// You can write your code in this editor

/// Follow target player

// If target doesn't exist or effect ended, destroy this indicator
if (!instance_exists(target) || target.effect_timer <= 0) {
    instance_destroy();
    exit;
}

// Follow the target
x = target.x + offset_x; // Use offset_x
y = target.y + offset_y;

// Optional: Bob up and down
offset_y = -10 + sin(current_time / 200) * 4;






























