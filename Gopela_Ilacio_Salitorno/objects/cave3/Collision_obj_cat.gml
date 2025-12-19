

/// @description Teleport to Cave 3
if (obj_cat.teleport_cooldown <= 0) {
    obj_cat.x = 313;
    obj_cat.y = 35 + 10;
    teleport_cooldown = 30; // 3 seconds at 60 FPS (3 * 60 = 180)
    show_debug_message("Cave 1 triggered! Teleporting cat to Cave 3");
}