// Decrease timer
if (time_left > 0) {
    time_left -= 1 / room_speed;
    time_left = max(0, time_left);
}


if (time_left <= 0) {
    time_left = 0;
    // Trigger event once
    if (!timer_done) {
        timer_done = true;
        
		if(room==Map1){
			room_goto(Map2);
		} else if (room==Map2){
			room_goto(Map3);
		} 
		
		show_debug_message("TIME UP!");
        // game_over();
    }
}
