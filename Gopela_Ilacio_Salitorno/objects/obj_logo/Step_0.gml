if (state == "fade_in") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "hold";
    }
}
else if (state == "hold") {
    hold_timer++;
    if (hold_timer >= hold_duration) {
        state = "fade_out";
    }
}
else if (state == "fade_out") {
    alpha -= fade_speed;
    if (alpha <= 0) {
        room_goto_next();
    }
}

// Skip with any key
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
    room_goto_next();
}