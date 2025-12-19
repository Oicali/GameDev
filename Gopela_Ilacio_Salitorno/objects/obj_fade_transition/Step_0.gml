if (mode == "in") {
    // Fade in (black disappears)
    if (alpha > 0) {
        alpha -= fade_speed;
    } else {
        instance_destroy();
    }
}
else if (mode == "out") {
    // Fade out (screen goes black)
    if (alpha < 1) {
        alpha += fade_speed;
    } else {
        // Fade complete, change room
        if (target_room != -1) {
            room_goto(target_room);
        }
    }
}