// Press ESC to open pause menu
if (keyboard_check_pressed(vk_escape) && !global.game_paused) {
    global.game_paused = true;
    
    // DON'T deactivate - just set the flag
    // The players will check this flag and stop moving
    
    // Create pause menu
    instance_create_depth(0, 0, -10000, obj_pause_menu);
}