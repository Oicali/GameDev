alpha = 0;
fade_speed = 0.02;
depth = -9999;

if (!variable_instance_exists(id, "mode")) {
    mode = "in";
}

target_room = -1;

// ADD THESE:
is_gift_teleport = false; // Flag to indicate gift teleport
saved_timer_value = 81;   // Timer value to restore
saved_cheese_value = 0;   // Cheese value to restore