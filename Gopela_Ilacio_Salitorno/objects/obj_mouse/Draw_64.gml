/// @description Draw UI
// Display effect timer
if (effect_timer > 0) {
    var seconds_left = ceil(effect_timer / room_speed);
    var effect_text = "";
    var effect_color = c_white;
    
    // Determine effect type
    if (spd > base_spd) {
        effect_text = "SPEED BOOST";
        effect_color = c_lime;
    }
    else if (spd < base_spd && !is_stunned) {
        effect_text = "SLOWED";
        effect_color = c_red;
    }
    else if (is_stunned) {
        effect_text = "STUNNED";
        effect_color = c_yellow;
    }
    else if (is_confused) {
        effect_text = "CONFUSED";
        effect_color = c_purple;
    }
    
    // Draw timer text (positioned on right side)
    draw_set_color(effect_color);
    draw_set_halign(fa_right);
    draw_text(room_width - 10, 10, "Mouse: " + effect_text + " " + string(seconds_left) + "s");
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}

// Display cheese collected - GREEN when 10 or more
if (cheese_collected >= 10) {
    draw_set_color(c_lime);  // Green color
} else {
    draw_set_color(c_white);
}
draw_text(10, 10, "Mouse Cheese: " + string(cheese_collected) + "/10");
draw_set_color(c_white);  // Reset color