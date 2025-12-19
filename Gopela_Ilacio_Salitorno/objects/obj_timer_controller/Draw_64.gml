/// DRAW GUI EVENT

// ===== ROOM REFRESH DISPLAY (CHECK FIRST) =====
if (show_room_refresh) {
    draw_set_font(fnt_lilita_one);  // Changed font
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Blinking effect
    var blink = ((current_time div 500) mod 2 == 0);
    var main_color = blink ? c_yellow : c_orange;
    var outline_color = c_black;
    var text = "ROOM REFRESH";
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    var scale = 3;
    
    // Outline
    draw_set_color(outline_color);
    var stroke = 4;
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
    
    exit; // Don't draw anything else
}

// ... rest of your Draw GUI code stays the same ...

// ===== PAUSE CHECK =====
if (global.game_paused) {
    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(675, 650, "");
    exit; // skip drawing timer/countdown
}

// ===== COUNTDOWN DISPLAY =====
if (state == "countdown") {
    var count = ceil(countdown_time);

    var text = "";
    if (count > 1) {
        text = string(count - 1); // Shows 3,2,1
    } else {
        text = "GO!";
    }

    // Position (center of screen)
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Colors
    var main_color = (text == "GO!") ? make_color_rgb(0, 180, 0) : make_color_rgb(220, 180, 40);
    var outline_color = c_black;

    // Scale pulse effect
    var scale = 3.2;
    if (countdown_time - floor(countdown_time) < 0.5) {
        scale = 3.7;
    }

    // Outline
    draw_set_color(outline_color);
    for (var ox = -5; ox <= 5; ox++) {
        for (var oy = -5; oy <= 5; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text_transformed(cx + ox, cy + oy, text, scale, scale, 0);
            }
        }
    }

    // Main fill
    draw_set_color(main_color);
    draw_text_transformed(cx, cy, text, scale, scale, 0);
}
else if (state == "active") {
    // ===== ROUND TIMER =====
    var minutes = floor(time_left / 60);
    var seconds = floor(time_left mod 60);
    var sec_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);
    var timer_text = string(minutes) + ":" + sec_text;

    // Position (shifted right by 75 total)
    var draw_x = 635;
    var draw_y = 650;

    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Outline
    draw_set_color(c_black);
    for (var ox = -2; ox <= 2; ox++) {
        for (var oy = -2; oy <= 2; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text_transformed(draw_x + ox, draw_y + oy, timer_text, 1.3, 1.3, 0);
            }
        }
    }

    // ===== MAIN FILL =====
    if (time_left < 30) {
        // Blinking effect: alternate between gradient and red
        var blink = ((current_time div 500) mod 2 == 0);

        if (blink) {
            // Gradient yellow–orange
            var gradient_top = make_color_rgb(255, 240, 120);
            var gradient_bottom = make_color_rgb(255, 128, 0);

            draw_set_color(gradient_top);
            draw_text_transformed(draw_x, draw_y - 1, timer_text, 1.3, 1.3, 0);

            draw_set_color(gradient_bottom);
            draw_text_transformed(draw_x, draw_y + 2, timer_text, 1.3, 1.3, 0);

            draw_set_color(make_color_rgb(255, 220, 100));
            draw_text_transformed(draw_x, draw_y, timer_text, 1.3, 1.3, 0);
        } else {
            // Solid red
            draw_set_color(make_color_rgb(200, 0, 0));
            draw_text_transformed(draw_x, draw_y, timer_text, 1.3, 1.3, 0);
        }
    } else {
        // Normal gradient look
        var gradient_top = make_color_rgb(255, 240, 120);
        var gradient_bottom = make_color_rgb(255, 128, 0);

        draw_set_color(gradient_top);
        draw_text_transformed(draw_x, draw_y - 1, timer_text, 1.3, 1.3, 0);

        draw_set_color(gradient_bottom);
        draw_set_color(gradient_bottom);
        draw_text_transformed(draw_x, draw_y + 2, timer_text, 1.3, 1.3, 0);

        draw_set_color(make_color_rgb(255, 220, 100));
        draw_text_transformed(draw_x, draw_y, timer_text, 1.3, 1.3, 0);
    }
}