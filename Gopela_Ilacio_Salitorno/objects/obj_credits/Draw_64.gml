// DEBUG - Draw this ALWAYS
draw_set_color(c_red);
draw_set_font(-1);
draw_text(10, 10, "Credits exists!");
draw_text(10, 30, "Active: " + string(active));
draw_text(10, 50, "Visible: " + string(visible));
draw_set_color(c_white);

// Rest of your draw code...
if (!visible) exit;
// etc...