/// DRAW GUI EVENT
// ===== CAT ROUND WIN MESSAGE =====


// ===== CAT SCORE DISPLAY (TOP RIGHT) =====
{
    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    var score_text = "CAT: " + string(global.cat_score);
    var draw_x = room_width - 20;
    var draw_y = 20;
    
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
    
    // Main fill (bright orange)
    var main_color = make_color_rgb(255, 140, 0);
    draw_set_color(main_color);
    draw_text(draw_x, draw_y, score_text);
    draw_set_halign(fa_left);
}