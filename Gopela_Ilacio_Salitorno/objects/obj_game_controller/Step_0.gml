// Press ESC to open pause menu
if (keyboard_check_pressed(vk_escape) && !global.game_paused) {
    global.game_paused = true;
    
    // DON'T deactivate - just set the flag
    // The players will check this flag and stop moving
    
    // Create pause menu
    instance_create_depth(0, 0, -10000, obj_pause_menu);
}

// Your existing code (pause menu, etc.)...

// ADD THIS SECTION at the bottom:

// Don't check win conditions if game is paused
if (global.game_paused) exit;

// Don't run if game is already over
if (game_over) exit;

// METHOD 1: Timer-based win (uncomment if you want time limit)
/*
game_time -= 1;

if (game_time <= 0) {
    game_over = true;
    
    // Determine winner based on score
    var winner_name = "";
    if (global.cat_score > global.mouse_score) {
        winner_name = "cat";
    } else if (global.mouse_score > global.cat_score) {
        winner_name = "mouse";
    } else {
        winner_name = "cat"; // Default to cat if tie
    }
    
    // Show win screen
    with (obj_win_screen) {
        visible = true;
        active = true;
        winner = winner_name;
        cat_score = global.cat_score;
        mouse_score = global.mouse_score;
    }
}
*/

// METHOD 2: Score-based win (first to reach win_score)
if (global.cat_score >= win_score) {
    game_over = true;
    
    // Cat wins!
    with (obj_win_screen) {
        visible = true;
        active = true;
        winner = "cat";
        cat_score = global.cat_score;
        mouse_score = global.mouse_score;
    }
}

if (global.mouse_score >= win_score) {
    game_over = true;
    
    // Mouse wins!
    with (obj_win_screen) {
        visible = true;
        active = true;
        winner = "mouse";
        cat_score = global.cat_score;
        mouse_score = global.mouse_score;
    }
}