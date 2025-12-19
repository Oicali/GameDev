/// DRAW GUI EVENT
// ===== CAT ROUND WIN MESSAGE =====
if (show_cat_winner) {
    // Calculate slide animation
    if (!variable_instance_exists(id, "cat_winner_slide_progress")) {
        cat_winner_slide_progress = 0;
    }
    
    // Animate slide progress (0 to 1)
    if (cat_winner_slide_progress < 1) {
        cat_winner_slide_progress += 0.05; // Speed of slide (adjust for faster/slower)
    }
    
    // Easing function for smooth animation (ease-out)
    var ease_progress = 1 - power(1 - cat_winner_slide_progress, 3);
    
    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Blinking effect
    var blink = ((current_time div 500) mod 2 == 0);
    var main_color = blink ? make_color_rgb(204, 153, 0) : make_color_rgb(255, 140, 0);
    var outline_color = c_black;
    var text = "CAT WINS THIS ROUND";
    
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    
    // Calculate Y position with slide effect (starts above screen, slides down)
    var start_y = -100; // Starting position (off-screen above)
    var target_y = cy;  // Target position (center)
    var current_y = start_y + (target_y - start_y) * ease_progress;
    
    var scale = 3;
    
    // Outline
    draw_set_color(outline_color);
    var stroke = 3;
    for (var ox = -stroke; ox <= stroke; ox++) {
        for (var oy = -stroke; oy <= stroke; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text_transformed(cx + ox, current_y + oy, text, scale, scale, 0);
            }
        }
    }
    
    // Main fill
    draw_set_color(main_color);
    draw_text_transformed(cx, current_y, text, scale, scale, 0);
} else {
    // Reset animation when not showing
    cat_winner_slide_progress = 0;
}

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