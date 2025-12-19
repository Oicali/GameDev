// Arrow key navigation - UP
if (keyboard_check_pressed(vk_up)) {
    audio_play_sound(snd_hovered, 1, false); // ADD THIS
    selected--;
    if (selected < 0) {
        selected = menu_options - 1;
    }
}

// Arrow key navigation - DOWN
if (keyboard_check_pressed(vk_down)) {
    audio_play_sound(snd_hovered, 1, false); // ADD THIS
    selected++;
    if (selected >= menu_options) {
        selected = 0;
    }
}

// Enter or Space to select option
// Enter or Space to select option
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    audio_play_sound(snd_enter, 1, false); // Add click sound
    
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
            instance_destroy();
            instance_create_depth(0, 0, -10000, obj_settings_menu);
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