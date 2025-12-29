show_debug_message("State: " + fade_state + " | Alpha: " + string(fade_alpha));

// ===== FADE IN (black screen disappears) =====
if (fade_state == "fade_in") {
    fade_alpha -= fade_in_speed;
    
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        fade_state = "hold";
        hold_timer = hold_time;
    }
}

// ===== HOLD =====
else if (fade_state == "hold") {
    hold_timer -= 1;
    
    if (hold_timer <= 0) {
        fade_state = "fade_out";
    }
}

// ===== FADE OUT (black screen appears) =====
else if (fade_state == "fade_out") {
    fade_alpha += fade_out_speed;
    
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        // DON'T change rooms here anymore
    }
}

// ===== GO TO NEXT ROOM AFTER FULLY FADED =====
if (fade_alpha >= 1 && fade_state == "fade_out") {
    room_goto(Home);  // Now transitions when fully black
}

// ===== SKIP WITH ANY KEY =====
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
   fade_alpha = 1;
  room_goto(Home); 
}