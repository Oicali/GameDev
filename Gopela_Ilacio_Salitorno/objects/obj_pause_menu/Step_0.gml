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
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    // Optional: Add a different click sound here
    // audio_play_sound(snd_enter, 1, false);
    
    switch(selected) {
        case 0: // Resume
            global.game_paused = false;
            instance_destroy();
            break;
            
        case 1: // Restart
            global.game_paused = false;
            room_restart();
            instance_destroy();
            break;
            
        case 2: // Settings
            global.game_paused = false;
            instance_destroy();
            show_message("Settings coming soon!");
            break;
            
        case 3: // Quit to main menu
            global.game_paused = false;
            audio_stop_all();
            global.mouse_score = 0;
            global.cat_score = 0;
            room_goto(Home);
            instance_destroy();
            break;
    }
}