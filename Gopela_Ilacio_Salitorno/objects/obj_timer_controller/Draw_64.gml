// Build timer text
var minutes = floor(time_left / 60);
var seconds = floor(time_left mod 60);
var sec_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);
var timer_text = string(minutes) + ":" + sec_text;

// Position
var draw_x = 600;
var draw_y = 650;

// Font
draw_set_font(fnt_timer);

// Outline (black, thick)
draw_set_color(c_black);
for (var ox = -2; ox <= 2; ox++) {
    for (var oy = -2; oy <= 2; oy++) {
        if (ox != 0 || oy != 0) {
         draw_text(draw_x + ox, draw_y + oy, timer_text);
        }
    }
}

// Gradient fill (yellow to orange)
var gradient_top = make_color_rgb(255, 255, 0);   // bright yellow
var gradient_bottom = make_color_rgb(255, 128, 0); // orange

// Simulate gradient by drawing top half slightly above, bottom half slightly below
draw_set_color(gradient_top);
draw_text(draw_x, draw_y - 1, timer_text);

draw_set_color(gradient_bottom);
draw_text(draw_x, draw_y + 2, timer_text);

if (time_left < 30) {
    var flash_color = ((current_time div 500) mod 2 == 0) ? c_red : c_yellow;
    draw_set_color(flash_color);
}

// Final pass: center fill (bright yellow)
draw_set_color(c_yellow);
draw_text(draw_x, draw_y, timer_text);
