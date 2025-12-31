// Initialize global variables
if (!variable_global_exists("menu_is_blocking_buttons")) {
    global.menu_is_blocking_buttons = false;
}
if (!variable_global_exists("game_paused")) {
    global.game_paused = false;
}

depth = -99999999;
visible = false;
active = false;

current_page = 1;
total_pages = 2;

page_sprites[0] = credits1;
page_sprites[1] = credits2;

page_x = room_width / 2;
page_y = room_height / 2;

target_width = room_width * 0.9;
sprite_scale = target_width / sprite_get_width(credits1);

left_arrow_x = room_width * 0.47;
left_arrow_y = room_height * 0.75;
left_arrow_radius = 40;

right_arrow_x = room_width * 0.53;
right_arrow_y = room_height * 0.75;
right_arrow_radius = 40;


back_btn_x = room_width * 0.73;
back_btn_y = room_height * 0.30;
back_btn_radius = 50;

mouse_over_button = "";
mouse_over_button_previous = "";