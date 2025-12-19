alpha = 0; // Start transparent
fade_speed = 0.02; // Adjust speed (higher = faster)
depth = -9999;

// Set mode
if (!variable_instance_exists(id, "mode")) {
    mode = "in"; // "in" (fade in from black) or "out" (fade out to black)
}

target_room = -1; // Room to go to after fade out