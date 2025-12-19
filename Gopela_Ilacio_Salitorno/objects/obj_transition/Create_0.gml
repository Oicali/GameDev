circle_radius = 0;
transition_speed = 9;

var cam = view_camera[0];
center_x = camera_get_view_width(cam) / 2;
center_y = camera_get_view_height(cam) / 2;
max_radius = point_distance(0, 0, camera_get_view_width(cam), camera_get_view_height(cam));

depth = -9999;

// Create surface for masking
surf = -1;