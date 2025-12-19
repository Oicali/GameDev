/// DRAW GUI EVENT

// ===== CAT ROUND WIN MESSAGE =====
if (show_cat_winner) {
    draw_set_font(fnt_lilita_one); // use your new font
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Blinking effect: alternate between dark yellow and orange
    var blink = ((current_time div 500) mod 2 == 0);
    var main_color = blink ? make_color_rgb(204, 153, 0) : make_color_rgb(255, 140, 0); 
    // dark yellow (goldenrod) and orange

    var outline_color = c_black;

    var text = "CAT WINS THIS ROUND";
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


// ===== CAT SCORE DISPLAY (TOP RIGHT) =====
{
    draw_set_font(fnt_lilita_one); // use your new font
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);

    var score_text = "CAT: " + string(global.cat_score);
    var draw_x = room_width - 20;
    var draw_y = 20;
    
    var outline_color = c_black;
    var stroke = 2; // thinner outline
    draw_set_color(outline_color);
    for (var ox = -stroke; ox <= stroke; ox++) {
        for (var oy = -stroke; oy <= stroke; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text(draw_x + ox, draw_y + oy, score_text);
            }
        }
    }

    // Main fill (bright orange)
    var main_color = make_color_rgb(255, 140, 0);
    draw_set_color(main_color);
    draw_text(draw_x, draw_y, score_text);

    draw_set_halign(fa_left);
}
