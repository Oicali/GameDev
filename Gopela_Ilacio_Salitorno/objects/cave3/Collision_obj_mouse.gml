

/// @description Teleport to Cave 3
if (obj_mouse.teleport_cooldown <= 0) {
    obj_mouse.x = 313;
    obj_mouse.y = 35 + 10;
    teleport_cooldown = 0; // 3 seconds at 60 FPS (3 * 60 = 180)
    show_debug_message("Cave 1 triggered! Teleporting cat to Cave 3");
}/// @description Teleport to Cave 2
x = 313;
y = 31;