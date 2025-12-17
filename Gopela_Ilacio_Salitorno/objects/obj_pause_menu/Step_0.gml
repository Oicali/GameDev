// Arrow key navigation - UP
if (keyboard_check_pressed(vk_up)) {
    selected--;
    if (selected < 0) {
        selected = menu_options - 1;
    }
}

// Arrow key navigation - DOWN
if (keyboard_check_pressed(vk_down)) {
    selected++;
    if (selected >= menu_options) {
        selected = 0;
    }
}

// Enter or Space to select option
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
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
            room_goto(Home);
            instance_destroy();
            break;
    }
}

// ESC key to resume
if (keyboard_check_pressed(vk_escape)) {
    global.game_paused = false;
    instance_destroy();
}