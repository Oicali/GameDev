/// STEP EVENT

// ===== COUNTDOWN STATE =====
if (state == "countdown") {
    // Decrease countdown
    countdown_time -= 1 / room_speed;

    // When countdown finishes, switch to active round
    if (countdown_time <= 0 && !countdown_done) {
        countdown_done = true;
        state = "active";
    }
}

// ===== ACTIVE ROUND STATE =====
else if (state == "active") {
    // Decrease timer
    if (time_left > 0) {
        time_left -= 1 / room_speed;
        time_left = max(0, time_left);
    }

    // Trigger warning sound when time hits 10
    if (time_left <= 11) {
        if (loop_count < 3) {
            if (!audio_is_playing(snd_warning)) {
                audio_play_sound(snd_warning, 1, false);
                loop_count += 1;
            }
        }
    }

    // Handle timer end
    if (time_left <= 0) {
        time_left = 0;

        if (!timer_done) {
            timer_done = true;

            global.cat_score += 1;
            show_debug_message("increment");
            show_debug_message("cat score: " + string(global.cat_score));

            if (global.cat_score == 3) {
                show_debug_message("Cat Champion");
                audio_stop_all();
                room_goto(Home);
                global.mouse_score = 0;
                global.cat_score = 0;
            } else {
                var rooms = [];
                if (room == Map1) {
                    rooms = [Map2, Map3];
                } else if (room == Map2) {
                    rooms = [Map1, Map3];
                } else if (room == Map3) {
                    rooms = [Map2, Map1];
                }

                // Pick a random index
                var choice = irandom(array_length(rooms) - 1);
                room_goto(rooms[choice]);

                show_debug_message("TIME UP!");
            }
        }
    }
}
