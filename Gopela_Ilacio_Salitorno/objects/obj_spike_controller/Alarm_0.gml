/// @description Alternate Spike Patterns
if (current_pattern == "horizontal") {
    show_vertical_spikes();
}
else {
    show_horizontal_spikes();
}

// Reset alarm for next switch
alarm[0] = 8 * room_speed;