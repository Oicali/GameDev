/// @description Scale Cheese Size
// Make cheese smaller (0.5 = half size, 0.75 = 3/4 size, etc.)
image_xscale = 0.5;  // Adjust this number (try 0.5, 0.6, 0.7, etc.)
image_yscale = 0.6;

is_teleporting = false;
teleport_phase = 0;  // 0 = normal, 1 = fading out, 2 = moving, 3 = fading in
teleport_timer = 0;
target_x = x;
target_y = y;