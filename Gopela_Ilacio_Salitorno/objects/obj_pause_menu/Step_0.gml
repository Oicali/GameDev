// Get mouse position in GUI coordinates
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Reset mouse hover
mouse_over = -1;

// Get button width for click detection (approximate text width)
var button_width = 200; // Adjust based on your longest text

// Check mouse hover for each menu option
// RESUME
if (mx >= text_x - button_width/2 && mx <= text_x + button_width/2 &&
    my >= resume_y - button_height/2 && my <= resume_y + button_height/2) {
    mouse_over = 0;
    selected = 0;
}

// RESTART
if (mx >= text_x - button_width/2 && mx <= text_x + button_width/2 &&
    my >= restart_y - button_height/2 && my <= restart_y + button_height/2) {
    mouse_over = 1;
    selected = 1;
}

// SETTINGS
if (mx >= text_x - button_width/2 && mx <= text_x + button_width/2 &&
    my >= settings_y - button_height/2 && my <= settings_y + button_height/2) {
    mouse_over = 2;
    selected = 2;
}

// QUIT
if (mx >= text_x - button_width/2 && mx <= text_x + button_width/2 &&
    my >= quit_y - button_height/2 && my <= quit_y + button_height/2) {
    mouse_over = 3;
    selected = 3;
}

// Arrow key navigation - UP
if (keyboard_check_pressed(vk_up)) {
    if (audio_exists(snd_hovered)) audio_play_sound(snd_hovered, 1, false);
    selected--;
    if (selected < 0) {
        selected = menu_options - 1;
    }
}

// Arrow key navigation - DOWN
if (keyboard_check_pressed(vk_down)) {
    if (audio_exists(snd_hovered)) audio_play_sound(snd_hovered, 1, false);
    selected++;
    if (selected >= menu_options) {
        selected = 0;
    }
}

// Mouse click OR keyboard select
var activate = mouse_check_button_pressed(mb_left) || 
               keyboard_check_pressed(vk_enter) || 
               keyboard_check_pressed(vk_space);

if (activate && mouse_over != -1) {
    // Play click sound
    if (audio_exists(snd_enter)) audio_play_sound(snd_enter, 1, false);
    
    switch(selected) {
        case 0: // Resume
            global.game_paused = false;
            instance_destroy();
            break;
            
        case 1: // Restart
            with (obj_settings_menu) instance_destroy();
            with (obj_howtoplay_menu) instance_destroy();
            global.game_paused = false;
            room_restart();
            instance_destroy();
            break;
            
        case 2: // Settings
            // Create settings menu if it doesn't exist
            if (!instance_exists(obj_settings_menu)) {
                instance_create_depth(0, 0, -11000, obj_settings_menu);
            }
            
            // Show settings menu
            with (obj_settings_menu) {
                visible = true;
                active = true;
            }
            
            instance_destroy();
            break;
            
        case 3: // Quit to main menu
            with (obj_settings_menu) instance_destroy();
            with (obj_howtoplay_menu) instance_destroy();
            
            // RESET ALL GAME STATES
            global.game_paused = false;
            global.mouse_score = 0;
            global.cat_score = 0;
            global.round = 1;
            global.mouse_cheese_collected = 0;
            global.saved_timer = 81;
            global.teleported_by_gift = false;
            
            audio_stop_all();
            room_goto(Home);
            instance_destroy();
            break;
    }
}

// Keyboard only select (when not hovering with mouse)
if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) && mouse_over == -1) {
    if (audio_exists(snd_enter)) audio_play_sound(snd_enter, 1, false);
    
    switch(selected) {
        case 0: // Resume
            global.game_paused = false;
            instance_destroy();
            break;
            
        case 1: // Restart
            with (obj_settings_menu) instance_destroy();
            with (obj_howtoplay_menu) instance_destroy();
            global.game_paused = false;
            room_restart();
            instance_destroy();
            break;
            
        case 2: // Settings
            if (!instance_exists(obj_settings_menu)) {
                instance_create_depth(0, 0, -11000, obj_settings_menu);
            }
            
            with (obj_settings_menu) {
                visible = true;
                active = true;
            }
            
            instance_destroy();
            break;
            
        case 3: // Quit to main menu
            with (obj_settings_menu) instance_destroy();
            with (obj_howtoplay_menu) instance_destroy();
            
            // RESET ALL GAME STATES
            global.game_paused = false;
            global.mouse_score = 0;
            global.cat_score = 0;
            global.round = 1;
            global.mouse_cheese_collected = 0;
            global.saved_timer = 81;
            global.teleported_by_gift = false;
            
            audio_stop_all();
            room_goto(Home);
            instance_destroy();
            break;
    }
}