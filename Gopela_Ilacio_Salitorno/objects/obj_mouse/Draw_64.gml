/// @description Draw UI
/// DRAW GUI EVENT

// ===== MOUSE ROUND WIN MESSAGE =====
if (show_mouse_winner) {
    draw_set_font(fnt_lilita_one); // use new font
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Blinking effect: alternate between green and blue
    var blink = ((current_time div 500) mod 2 == 0);
    var main_color = blink ? make_color_rgb(0, 200, 0) : make_color_rgb(0, 120, 255); // green/blue
    var outline_color = c_black;

    var text = "MOUSE WINS THIS ROUND";
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    var scale = 3;

    // Outline
    draw_set_color(outline_color);
    var stroke = 3; // thinner outline
    for (var ox = -stroke; ox <= stroke; ox++) {
        for (var oy = -stroke; oy <= stroke; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text_transformed(cx + ox, cy + oy, text, scale, scale, 0);
            }
        }
    }

    // Main fill
    draw_set_color(main_color);
    draw_text_transformed(cx, cy, text, scale, scale, 0);
}


// ===== EFFECT TIMER DISPLAY =====
if (effect_timer > 0) {
    var seconds_left = ceil(effect_timer / room_speed);
    var effect_text = "";
    var effect_color = c_white;
    
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
    
    draw_set_font(fnt_lilita_one); // use new font
    draw_set_color(effect_color);
    draw_set_halign(fa_right);
    draw_text(room_width - 10, 10, "Mouse: " + effect_text + " " + string(seconds_left) + "s");
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}


// ===== MOUSE SCORE (TOP LEFT) =====
{
    draw_set_font(fnt_lilita_one); // use new font
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var score_text = "Mouse: "+ string(global.mouse_score);
    var draw_x = 10;
    var draw_y = 10;

    // Outline
    var outline_color = c_black;
    var stroke = 2;
    draw_set_color(outline_color);
    for (var ox = -stroke; ox <= stroke; ox++) {
        for (var oy = -stroke; oy <= stroke; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text(draw_x + ox, draw_y + oy, score_text);
            }
        }
    }

    // Main fill
    var main_color = make_color_rgb(0, 180, 255); // pleasing blue
    draw_set_color(main_color);
    draw_text(draw_x, draw_y, score_text);
}


// ===== CHEESE COUNTER (BOTTOM LEFT) =====
{
    draw_set_font(fnt_lilita_one); // use new font
    var cheese_text = "Mouse Cheese: " + string(cheese_collected) + "/10";
    var draw_x = 10;
    var draw_y = display_get_gui_height() - 40; // bottom left

    var main_color = (cheese_collected >= 10) ? c_lime : c_white;
    var outline_color = c_black;

    // Outline
    var stroke = 2;
    draw_set_color(outline_color);
    for (var ox = -stroke; ox <= stroke; ox++) {
        for (var oy = -stroke; oy <= stroke; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text(draw_x + ox, draw_y + oy, cheese_text);
            }
        }
    }

    // Main fill
    draw_set_color(main_color);
    draw_text(draw_x, draw_y, cheese_text);

    draw_set_color(c_white); // reset
}
