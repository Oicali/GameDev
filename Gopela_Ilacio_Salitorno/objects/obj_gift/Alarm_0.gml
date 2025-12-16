/// @description Respawn gift within camera view
show_debug_message("=== ALARM 0 TRIGGERED ===");

// Get camera bounds
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Spawn within camera view (with 50px border)
x = cam_x + irandom_range(50, cam_w - 50);
y = cam_y + irandom_range(50, cam_h - 50);

// Make sure it's within room bounds too
x = clamp(x, 50, room_width - 50);
y = clamp(y, 50, room_height - 50);

// Make visible and reset collected flag
visible = true;
image_alpha = 1;
collected = false; // Allow collection again

audio_play_sound(snd_gift_spawn, 0, false);
show_debug_message("Gift respawned at X:" + string(x) + " Y:" + string(y));
show_debug_message("Camera at X:" + string(cam_x) + " Y:" + string(cam_y));
show_debug_message("Visible: " + string(visible) + " Alpha: " + string(image_alpha));