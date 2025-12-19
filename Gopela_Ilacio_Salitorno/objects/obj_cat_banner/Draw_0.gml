/// @description Draw banner with slide animation and scores
// Calculate slide animation
if (visible) {
    if (!variable_instance_exists(id, "banner_slide_progress")) {
        banner_slide_progress = 0;
    }
    
    // Animate slide progress (0 to 1)
    if (banner_slide_progress < 1) {
        banner_slide_progress += 0.05; // Speed of slide (adjust for faster/slower)
    }
} else {
    // Reset animation when not visible
    banner_slide_progress = 0;
}
// Easing function for smooth animation (ease-out)
var ease_progress = 1 - power(1 - banner_slide_progress, 3);
// Calculate Y position with slide effect
var original_y = 180; // Your target Y position
var start_y = -200;   // Starting position (off-screen above)
var current_y = start_y + (original_y - start_y) * ease_progress;
// Draw the banner sprite at animated position
draw_sprite_ext(sprite_index, image_index, x, current_y, 
                image_xscale, image_yscale, image_angle, 
                image_blend, image_alpha);
// Draw the scores if banner is visible
if (visible) {
    draw_set_font(fnt_lilita_one);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    
    // Cat score position (adjust these coordinates based on your banner design)
    var cat_score_x = x - 10;  // Offset from banner x
    var cat_score_y = current_y + 27;  // Use current_y for animation
    
    // Mouse score position
    var mouse_score_x = x - 10;
    var mouse_score_y = current_y + 57;  // Use current_y for animation
    
    // Draw Cat score
    draw_set_color(c_black); // Outline
    draw_text(cat_score_x + 1, cat_score_y + 1, string(global.cat_score));
    draw_set_color(c_orange);
    draw_text(cat_score_x, cat_score_y, string(global.cat_score));
    
    // Draw Mouse score
    draw_set_color(c_black); // Outline
    draw_text(mouse_score_x + 1, mouse_score_y + 1, string(global.mouse_score));
    draw_set_color(c_blue);
    draw_text(mouse_score_x, mouse_score_y, string(global.mouse_score));
    
    // Optional: "Press any key" prompt
    if (instance_exists(obj_cat) && obj_cat.show_cat_champion) {
        draw_set_halign(fa_center);
        
        // Blinking "Press any key" text with smaller size
        var blink = ((current_time div 500) mod 2 == 0);
        if (blink) {
            var scale = 0.6; // Smaller text size
            draw_set_color(c_black);
            draw_text_transformed(x + 1, current_y + 145, "Press any key", scale, scale, 0);
            draw_set_color(c_white);
            draw_text_transformed(x, current_y + 144, "Press any key", scale, scale, 0);
        }
    }
    
    // Reset draw settings
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}