/// @description Effect Timer
// You can write your code in this editor

/// Display power-up timer on screen

if (effect_timer > 0) {
    var seconds_left = ceil(effect_timer / room_speed);
    var effect_text = "";
    var effect_color = c_white;
    
    // Determine efsfect type
    if (spd > base_spd) {
        effect_text = "SPEED BOOST";
        effect_color = c_lime;
    }
    else if (spd < base_spd && !is_stunned) {
        effect_text = "SLOWED";
        effect_color = c_aqua;
    }
    else if (is_stunned) {
        effect_text = "STUNNED";
        effect_color = c_red;
    }
	else if (is_confused) {
        effect_text = "CONFUSED";
        effect_color = c_yellow;
    }
    
    // Draw timer text
    draw_set_color(effect_color);
    draw_set_halign(fa_center);
    draw_text(room_width/2, 20, effect_text + ": " + string(seconds_left) + "s");
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}




















