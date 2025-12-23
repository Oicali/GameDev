/// @description Alarm[1] - Show banner after fight cloud

// DON'T restore sprite yet - keep fight cloud visible!
// sprite_index = original_sprite;  // <-- REMOVED

// Make mouse visible again
obj_mouse.visible = true;

// Reset mouse position (but don't move yet)
obj_mouse.x = 700;
obj_mouse.y = 600;

if (show_champion_pending) {
    // Show champion banner
    obj_cat_champion.visible = true;
    audio_stop_all();
    audio_play_sound(snd_victory, 0, false);
    
    // Set flag for key detection
    show_cat_champion = true;
    show_champion_pending = false;
}
else if (show_banner_pending) {
    // Show round win banner
    audio_stop_all();
    audio_play_sound(snd_win_round, 0, false);
    audio_play_sound(snd_cat_meow, 0, false);
    
    obj_cat_banner.visible = true;
    obj_cat_banner.image_xscale = 0.6;
    obj_cat_banner.image_yscale = 0.6;
    
    // Set alarm for room transition (5 seconds)
    alarm[0] = room_speed * 5;
    show_banner_pending = false;
}